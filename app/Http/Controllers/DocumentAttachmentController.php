<?php

namespace App\Http\Controllers;

use App\Http\Requests\DocumentAttachmentRequest;
use App\Http\Resources\DocumentAttachmentResource;
use App\Http\Resources\DocumentRequirementResource;
use Carbon\Carbon;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
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

        Log::info('controller request - executed');
        $userId = auth()->user()->replid;

        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'idcalon', 'iduser')
            ->where('iduser', $userId)
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

        return (new DocumentAttachmentResource($data))->response()->setStatusCode(200);

    }


}
