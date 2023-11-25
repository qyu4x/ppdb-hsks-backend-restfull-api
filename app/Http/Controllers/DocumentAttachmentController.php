<?php

namespace App\Http\Controllers;

use App\Http\Requests\DocumentAttachmentRequest;
use App\Http\Requests\UpdateDocumentAttachmentRequest;
use App\Http\Resources\DocumentAttachmentResource;
use App\Http\Resources\DocumentRequirementResource;
use App\Http\Resources\FindDocumentAttachmentResource;
use Carbon\Carbon;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class DocumentAttachmentController extends Controller
{

    public function findAllRequirementDocument(): JsonResponse
    {
        $requirements = DB::table('syarat')
            ->select('replid', 'syarat', 'jumlah', 'aktif', 'allcpd', 'upload')
            ->where('aktif', 1)
            ->orderBy('urutan')
            ->get();

        return (DocumentRequirementResource::collection($requirements))->response()->setStatusCode(200);
    }

    public function uploadDocument(DocumentAttachmentRequest $documentAttachmentRequest)
    {
        $data = $documentAttachmentRequest->validated();

        Log::info('upload document request - executed');
        $userId = auth()->user()->replid;

        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'idcalon', 'iduser')
            ->where('iduser', $userId)
            ->where('replid', $data['online_kronologis_id'])
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'user or online chronologies not found'
                ]
            ], 404));
        }

        $requirement = DB::table('syarat')
            ->select('replid')
            ->where('replid', '=', $data['document_type_id'])
            ->first();

        if (!$requirement) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'document type not found'
                ]
            ], 404));
        }

        $uploadedFiles = $documentAttachmentRequest->file('document');

        $originalFilename = $uploadedFiles->getClientOriginalName();
        $filename = md5(base64_encode($uploadedFiles->getClientOriginalName()));
        $extension = $uploadedFiles->getClientOriginalExtension();

        $documentUrlSource = '/storage/documents/' . $filename . '.' . $extension;
        $uploadedFiles->storePubliclyAs('documents', $filename . '.' . $extension, 'public');

        $data = [
            'idcalonsiswa' => $onlineChronologies->idcalon,
            'idonlinekronologis' => $onlineChronologies->replid,
            'file' => $originalFilename,
            'aktif' => 1,
            'newfile' => $documentUrlSource,
            'created_date' => Carbon::now('Asia/Jakarta'),
            'modified_date' => Carbon::now('Asia/Jakarta'),
            'iddokumentipe' => $requirement->replid
        ];

        $idAttachment = DB::table('psb_calonsiswa_attachment')->insertGetId($data);
        $data['replid'] = $idAttachment;

        return (new DocumentAttachmentResource((object)$data))->response()->setStatusCode(200)->header('Content-Type', 'application/json');

    }

    public function updateDocument(UpdateDocumentAttachmentRequest $updateDocumentAttachmentRequest): JsonResponse
    {
        Log::info("update document request - executed");
        $requestData = $updateDocumentAttachmentRequest->validated();

        $userId = auth()->user()->replid;

        $legacyRequirement = DB::table('syarat')
            ->select('replid')
            ->where('replid', '=', $requestData['document_type_id'])
            ->first();

        $updatedRequirement = DB::table('syarat')
            ->select('replid')
            ->where('replid', '=', $requestData['document_type_id'])
            ->first();

        if (!$legacyRequirement || !$updatedRequirement) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'document type not found'
                ]
            ], 404)->header('Content-Type', 'application/json'));
        }

        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'idcalon', 'iduser')
            ->where('iduser', $userId)
            ->where('replid', $requestData['online_kronologis_id'])
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'online chronologies not found'
                ]
            ], 404)->header('Content-Type', 'application/json'));
        }

        $documentAttachment = DB::table('psb_calonsiswa_attachment')
            ->select('replid', 'idcalonsiswa', 'file', 'newfile')
            ->where('aktif', 1)
            ->where('replid', $requestData['document_id'])
            ->where('iddokumentipe', $requestData['document_type_id'])
            ->where('idonlinekronologis', $onlineChronologies->replid)
            ->first();

        if (!$documentAttachment) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'document not found'
                ]
            ], 404)->header('Content-Type', 'application/json'));
        }

        $legacyFilePath = str_replace('/storage/', 'public/', $documentAttachment->newfile);
        if (!Storage::delete($legacyFilePath)) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'failed to delete the previous file'
                ]
            ], 404)->header('Content-Type', 'application/json'));
        }


        $uploadedFiles = $updateDocumentAttachmentRequest->file('document');

        $originalFilename = $uploadedFiles->getClientOriginalName();
        $filename = md5(base64_encode($uploadedFiles->getClientOriginalName()));
        $extension = $uploadedFiles->getClientOriginalExtension();

        $documentUrlSource = '/storage/documents/' . $filename . '.' . $extension;
        $uploadedFiles->storePubliclyAs('documents', $filename . '.' . $extension, 'public');

        $data = [
            'file' => $originalFilename,
            'aktif' => 1,
            'newfile' => $documentUrlSource,
            'modified_date' => Carbon::now('Asia/Jakarta'),
            'iddokumentipe' => $requestData['updated_document_id']
        ];

        DB::table('psb_calonsiswa_attachment')
            ->where('aktif', 1)
            ->where('replid', $requestData['document_id'])
            ->where('iddokumentipe', $requestData['document_type_id'])
            ->where('idonlinekronologis', $onlineChronologies->replid)->update($data);

        $documentAttachment = DB::table('psb_calonsiswa_attachment')
            ->select('replid', 'idcalonsiswa', 'idonlinekronologis', 'file', 'newfile', 'iddokumentipe', 'created_date', 'modified_date')
            ->where('aktif', 1)
            ->where('replid', $requestData['document_id'])
            ->where('iddokumentipe', $requestData['document_type_id'])
            ->where('idonlinekronologis', $onlineChronologies->replid)
            ->first();

        return (new DocumentAttachmentResource($documentAttachment))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');

    }

    public function findAllDocumentAttachmentCurrentUser(string $idOnlineChronologies) : JsonResponse {
        $userId = auth()->user()->replid;

        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'iduser')
            ->where('iduser', $userId)
            ->where('replid', $idOnlineChronologies)
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'user or online chronologies not found'
                ]
            ], 404)->header('Content-Type', 'application/json'));
        }

        $documentAttachment = DB::table('psb_calonsiswa_attachment')
            ->select('replid', 'idcalonsiswa', 'idonlinekronologis', 'iddokumentipe', 'file', 'newfile', 'created_date', 'modified_date')
            ->where('aktif', 1)
            ->get();

        return (FindDocumentAttachmentResource::collection($documentAttachment))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');
    }

    public function deleteDocument(string $idOnlineChronologies, string $idDocument)
    {
        $userId = auth()->user()->replid;

        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'iduser')
            ->where('iduser', $userId)
            ->where('replid', $idOnlineChronologies)
            ->first();

            if (!$onlineChronologies) {
                throw new HttpResponseException(response([
                    'errors' => [
                        'message' => 'user or online chronologies not found'
                    ]
                ], 404)->header('Content-Type', 'application/json'));
            }

        $documentAttachment = DB::table('psb_calonsiswa_attachment')
            ->select('replid', 'newfile')
            ->where('aktif', 1)
            ->where('replid', $idDocument)
            ->where('idonlinekronologis', $onlineChronologies->replid)
            ->first();

        if (!$documentAttachment) {
            return response([
                'errors' => [
                    'message' => 'Document not found'
                ]
            ], 404)->header('Content-Type', 'application/json');
        }

        if (!Storage::delete(str_replace('/storage/', 'public/', $documentAttachment->newfile))) {
            return response([
                'errors' => [
                    'message' => 'Failed to delete the file'
                ]
            ], 500)->header('Content-Type', 'application/json');
        }

        // Update the aktif column to 0 using Query Builder
        DB::table('psb_calonsiswa_attachment')
            ->where('replid', $idDocument)
            ->where('idonlinekronologis', $onlineChronologies->replid)
            ->update(['aktif' => 0]);

        return response([
            'message' => 'Success delete document'
        ], 200)->header('Content-Type', 'application/json');
    }

}
