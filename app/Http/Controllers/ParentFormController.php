<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\ParentFormResourceCollection;
use App\Http\Resources\ParentFormResource;
use App\Http\Requests\ParentFormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;



class ParentFormController extends Controller
{
    public function createParentForm(ParentFormRequest $parentFormRequest) : JsonResponse
    {   
       $data = $parentFormRequest->validated();
       $userId = auth()->user()->replid;

       $onlineChronologies = DB::table('online_kronologis')
           ->select('replid', 'iduser')
           ->where('replid', $data['online_kronologis_id'])
           ->where('idcalon', $data['calon_siswa_id'])
           ->where('iduser', $userId)
           ->first();

           if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'user or online chronologies not found'
                ]
            ], 404));
        }
        // Menggunakan query builder untuk menyimpan data ke dalam tabel calonsiswa_form_ortu
        $data = [
            'alasan' => $parentFormRequest->alasan,
            'gambarananak' => $parentFormRequest->gambarananak,
            'hambatananak' => $parentFormRequest->hambatananak,
            'pengalamananak' => $parentFormRequest->pengalamananak,
            'hubungansaudara' => $parentFormRequest->hubungansaudara,
            'peraturananak' => $parentFormRequest->peraturananak,
            'peranortu' => $parentFormRequest->peranortu,
            'responanak' => $parentFormRequest->responanak,
            'harapanortu_tutor' => $parentFormRequest->harapanortu_tutor,
            'harapanortu_pendidikan' => $parentFormRequest->harapanortu_pendidikan,
            'psikologisanak1' => $parentFormRequest->psikologsianak1,
            'psikologisanak2' => $parentFormRequest->psikologsianak2,
            'psikologisanak3' => $parentFormRequest->psikologsianak3,
            'psikologisanak4' => $parentFormRequest->psikologsianak4,
            'psikologisanak5' => $parentFormRequest->psikologsianak5,
            'psikologisanak6' => $parentFormRequest->psikologsianak6,
            'psikologisanak7' => $parentFormRequest->psikologsianak7,
            'psikologisanak8' => $parentFormRequest->psikologsianak8,
        ];

        DB::table('calonsiswa_form_ortu')->insert($data);

        
        // Kembalikan respons JSON sukses dengan resource yang telah dibuat
        return (new ParentFormResourceCollection($data))->response()->setStatusCode(201);
    }
}