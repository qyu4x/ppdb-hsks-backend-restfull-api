<?php

namespace App\Http\Controllers;

use App\Http\Resources\OnlineChronologiesPreviewResource;
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
                'hrm_company.phone',
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
}
