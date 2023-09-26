<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateOnlineChronologiesRequest;
use App\Http\Resources\OnlineChronologiesCreateResource;
use App\Http\Resources\OnlineChronologiesPreviewResource;
use App\Http\Resources\OnlineChronologiesPreviewResourceCollection;
use App\Http\Resources\UserRegisterResource;
use Carbon\Carbon;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;

class OnlineChronologiesController extends Controller
{

    private function queryFindPreviewOnlineChronologiesByIdAndUserId(string $userId, string $onlineChronologiesId) : mixed
    {
        $onlineChronologies = DB::table('online_kronologis')
            ->select(
                'online_kronologis.replid',
                'online_kronologis.ortu',
                'online_kronologis.namaortu',
                'online_kronologis.handphoneortu',
                'online_kronologis.whatsapportu',
                'online_kronologis.emailortu',
                'online_kronologis.namacalon',
                'online_kronologis.jeniskelamin',
                'online_kronologis.tanggallahir',
                'online_kronologis.abk',
                'online_kronologis.pemeriksaan_psikolog',
                'hrm_company.nama',
                'tahunajaran.tahunajaran',
                'tingkat.departemen',
                'tingkat.tingkat',
                'kelompoksiswa.kelompok',
                'users.email',
                'online_kronologis.tokenonline',
                'online_kronologis.iduser',
                'hrm_company.email as hrm_company_email',
                'hrm_company.wappdb',
                'hrm_company.wappdb2',
                'hrm_company.wappdb3',
                'hrm_company.logo',
                'hrm_company.phone',
                'hrm_company.street',
                'hrm_company.city',
                'hrm_company.zip',
                'hrm_company.country',
                'hrm_company.website',
                'online_kronologis.created_date',
                'online_kronologis.modified_date'
            )
            ->join('hrm_company', 'hrm_company.replid', '=', 'online_kronologis.idunitbisnis')
            ->join('tahunajaran', 'tahunajaran.replid', '=', 'online_kronologis.idtahunajaran')
            ->join('tingkat', 'tingkat.replid', '=', 'online_kronologis.idtingkat')
            ->join('users', 'users.replid', '=', 'online_kronologis.iduser')
            ->join('kelompoksiswa', 'kelompoksiswa.replid', '=', 'online_kronologis.idkelompokcalon')
            ->where('online_kronologis.replid', $onlineChronologiesId)
            ->where('online_kronologis.iduser', $userId)
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'online chronologies not found'
                ]
            ], 404));
        }

        return $onlineChronologies;
    }
    public function findPreviewOnlineChronologiesByIdAndUserId(string $userId, string $onlineChronologiesId) : JsonResponse
    {
        $userId = Crypt::decrypt(base64_decode($userId));
        $onlineChronologiesId = Crypt::decrypt(base64_decode($onlineChronologiesId));

        return (new OnlineChronologiesPreviewResource($this->queryFindPreviewOnlineChronologiesByIdAndUserId($userId, $onlineChronologiesId)))->response()->setStatusCode(200);
    }

    public function findCurrentPreviewOnlineChronologiesById(string $onlineChronologiesId) : JsonResponse
    {
        $userId = auth()->user()->replid;
        $onlineChronologiesId = Crypt::decrypt(base64_decode($onlineChronologiesId));

        return (new OnlineChronologiesPreviewResource($this->queryFindPreviewOnlineChronologiesByIdAndUserId($userId, $onlineChronologiesId)))->response()->setStatusCode(200);
    }

    public function findAllCurrentPreviewOnlineChronologies() : JsonResponse
    {
        $userId = auth()->user()->replid;

        $onlineChronologies = DB::table('online_kronologis')
            ->select(
                'online_kronologis.replid',
                'online_kronologis.ortu',
                'online_kronologis.namaortu',
                'online_kronologis.handphoneortu',
                'online_kronologis.whatsapportu',
                'online_kronologis.emailortu',
                'online_kronologis.namacalon',
                'online_kronologis.jeniskelamin',
                'online_kronologis.tanggallahir',
                'online_kronologis.abk',
                'online_kronologis.pemeriksaan_psikolog',
                'hrm_company.nama',
                'tahunajaran.tahunajaran',
                'tingkat.departemen',
                'tingkat.tingkat',
                'kelompoksiswa.kelompok',
                'users.email',
                'online_kronologis.tokenonline',
                'online_kronologis.iduser',
                'hrm_company.email as hrm_company_email',
                'hrm_company.wappdb',
                'hrm_company.wappdb2',
                'hrm_company.wappdb3',
                'hrm_company.phone',
                'online_kronologis.created_date',
                'online_kronologis.modified_date'
            )
            ->join('hrm_company', 'hrm_company.replid', '=', 'online_kronologis.idunitbisnis')
            ->join('tahunajaran', 'tahunajaran.replid', '=', 'online_kronologis.idtahunajaran')
            ->join('tingkat', 'tingkat.replid', '=', 'online_kronologis.idtingkat')
            ->join('users', 'users.replid', '=', 'online_kronologis.iduser')
            ->join('kelompoksiswa', 'kelompoksiswa.replid', '=', 'online_kronologis.idkelompokcalon')
            ->where('online_kronologis.iduser', $userId)
            ->get();

        return (new OnlineChronologiesPreviewResourceCollection($onlineChronologies))->response()->setStatusCode(200);
    }

    private function createOnlineChronologiesValidationAvailableDependencyData(mixed $data)
    {
        $company = DB::table('hrm_company')
            ->where('replid', $data['id_unit_bisnis'])
            ->first();

        if (!$company) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Unit business not found'
                    ]
                ]
            ], 404));
        }

        $academicYear = DB::table('tahunajaran')
            ->where('replid', $data['id_tahun_ajaran'])
            ->first();

        if (!$academicYear) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Academic year not found'
                    ]
                ]
            ], 404));
        }

        $grade = DB::table('tingkat')
            ->where('replid', $data['id_tingkat'])
            ->first();

        if (!$grade) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Grade level not found'
                    ]
                ]
            ], 404));
        }

        $program = DB::table('kelompoksiswa')
            ->where('replid', $data['id_kelompok_siswa'])
            ->first();

        if (!$program) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Student group not found'
                    ]
                ]
            ], 404));
        }
    }
    public function createOnlineChronologies(CreateOnlineChronologiesRequest $onlineChronologiesRequest) : JsonResponse
    {
        $data = $onlineChronologiesRequest->validated();
        $user = auth()->user();

        $userId = $user->replid;
        $emailUser = $user->email;

        $this->createOnlineChronologiesValidationAvailableDependencyData($data);

        $currentOnlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'emailortu', 'ortu', 'namaortu', 'handphoneortu', 'whatsapportu', 'tokenonline', 'iduser')
            ->where('iduser', '=', $userId)
            ->where('emailortu', '=', $emailUser)
            ->first();
        if (!$currentOnlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'User not found'
                    ]
                ]
            ], 404));
        }

        $onlineChronologiesId = DB::table('online_kronologis')->insertGetId([
            'iduser' => $userId,
            'ortu' => $currentOnlineChronologies->ortu,
            'namaortu' => $currentOnlineChronologies->namaortu,
            'handphoneortu' => $currentOnlineChronologies->handphoneortu,
            'emailortu' => $currentOnlineChronologies->emailortu,
            'whatsapportu' => $currentOnlineChronologies->whatsapportu,
            'namacalon' => $data['nama'],
            'jeniskelamin' => $data['jenis_kelamin'],
            'tanggallahir' => $data['tanggal_lahir'],
            'abk' => $data['abk'],
            'pemeriksaan_psikolog' => $data['pemeriksaan_psikolog'],
            'jenjang' => $data['jenjang'],
            'idtingkat' => $data['id_tingkat'],
            'idunitbisnis' => $data['id_unit_bisnis'],
            'idtahunajaran' => $data['id_tahun_ajaran'],
            'idkelompokcalon' => $data['id_kelompok_siswa'],
            'tokenonline' => $currentOnlineChronologies->tokenonline,
            'status' => 1,
            'created_date' => Carbon::now('Asia/Jakarta'),
            'modified_date' => Carbon::now('Asia/Jakarta')
        ]);

        $user = DB::table('users')
            ->select('users.replid', 'users.email', 'users.role', 'users.created_date', 'users.modified_date')
            ->where('users.replid', $userId)
            ->first();

        $onlineChronologies = DB::table('online_kronologis')
            ->select(
                'online_kronologis.replid',
                'online_kronologis.ortu',
                'online_kronologis.namaortu',
                'online_kronologis.handphoneortu',
                'online_kronologis.emailortu',
                'online_kronologis.whatsapportu',
                'online_kronologis.namacalon',
                'online_kronologis.jeniskelamin',
                'online_kronologis.tanggallahir',
                'online_kronologis.abk',
                'online_kronologis.pemeriksaan_psikolog',
                'online_kronologis.jenjang',
                'online_kronologis.idtingkat',
                'online_kronologis.idunitbisnis',
                'online_kronologis.idtahunajaran',
                'online_kronologis.idkelompokcalon',
                'online_kronologis.tokenonline',
                'online_kronologis.status',
                'online_kronologis.created_date',
                'online_kronologis.modified_date'
            )
            ->where('iduser', $userId)
            ->where('replid', $onlineChronologiesId)
            ->first();


        return (new OnlineChronologiesCreateResource(
            user: $user, onlineChronologies: $onlineChronologies
        ))->response()->setStatusCode(200);
    }
}
