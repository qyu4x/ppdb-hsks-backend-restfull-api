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
           ->where('iduser', $$userId)
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
            'replidcalonsiswa' => $parentFormRequest->replidcalonsiswa,
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
            'psikologianak1' => $parentFormRequest->psikologianak1,
            'psikologianak2' => $parentFormRequest->psikologianak2,
            'psikologianak3' => $parentFormRequest->psikologianak3,
            'psikologianak4' => $parentFormRequest->psikologianak4,
            'psikologianak5' => $parentFormRequest->psikologianak5,
            'psikologianak6' => $parentFormRequest->psikologianak6,
            'psikologianak7' => $parentFormRequest->psikologianak7,
            'psikologianak8' => $parentFormRequest->psikologianak8,
        ];

        DB::table('calonsiswa_form_ortu')->insert($data);

        // Buat instance resource dan kirimkan data sebagai respons
        $resource = new ParentFormResource($data);

        // Kembalikan respons JSON sukses dengan resource yang telah dibuat
        return response()->json(['data' => $resource], 201);
    }
}