<?php

namespace App\Http\Controllers;

use App\Http\Requests\StudentCandidatesUpdateRequest;
use App\Http\Resources\StudentCandidatesAvailableDataResource;
use App\Http\Resources\StudentCandidatesResource;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class StudentCandidatesController extends Controller
{

    public function findAvailableStudentCandidates(string $idOnlineChronologies, string $idStudentCandidates) : JsonResponse {

        $idUser = auth()->user()->replid;
        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid')
            ->where('replid', $idOnlineChronologies)
            ->where('iduser', $idUser)
            ->where('idcalon', $idStudentCandidates)
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Data not found'
                    ]
                ]
            ], 404));
        }

        $studentCandidates = DB::table('calonsiswa')
            ->select([
                'replid',
                'nama',
                'kelamin',
                'tgllahir',
            ])
            ->where('replid',  $idStudentCandidates)
            ->first();

        return (new StudentCandidatesAvailableDataResource($studentCandidates))->response()->setStatusCode(200);
    }

    public function updateStudentCandidates(StudentCandidatesUpdateRequest $studentCandidatesUpdateRequest): JsonResponse
    {
        $data = $studentCandidatesUpdateRequest->validated();

        $idUser = auth()->user()->replid;
        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid')
            ->where('replid', $data['idonlinekronologis'])
            ->where('iduser', $idUser)
            ->where('idcalon', $data['idcalon'])
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Data not found'
                    ]
                ]
            ], 404));
        }

        $data['pinbbm'] = $data['whatsappsiswa'];
        $dataToUpdateAfterIgnore  = collect($data)->except(['idonlinekronologis', 'idcalon', 'whatsappsiswa'])->toArray();
        DB::table('calonsiswa')
            ->where('replid', '=', $data['idcalon'])
            ->update($dataToUpdateAfterIgnore);

        $studentCandidates = DB::table('calonsiswa')
            ->select([
                'replid',
                'nik_siswa',
                'nama',
                'panggilan',
                'kelamin',
                'tmplahir',
                'tgllahir',
                'agama',
                'warga',
                'anakke',
                'jsaudara',
                'bahasa',
                'negara',
                'provinsi',
                'kota',
                'statanak',
                'kecamatan',
                'alamatsiswa',
                'kodepossiswa',
                'idtempattinggal',
                'telponsiswa',
                'hpsiswa',
                'pinbbm',
                'emailsiswa',
                'berat',
                'tinggi',
                'darah',
                'lingkarkepala',
                'jenjangasal',
                'asalsekolah',
                'tingkat',
                'jenjangakhir',
                'sekolahjenjang',
                'kps',
                'no_kps',
                'piplayak',
                'kip',
                'no_kip',
                'almayah',
                'almibu',
                'wali_opt',
            ])
            ->where('replid', $data['idcalon'])
            ->first();

        return (new StudentCandidatesResource($studentCandidates))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');
    }
}
