<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Resources\ParentFormResourceCollection;
use App\Http\Resources\ParentFormResource;
use App\Http\Requests\ParentFormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;
use Carbon\Carbon;



class ParentFormController extends Controller
{
    public function createParentForm(ParentFormRequest $parentFormRequest) : JsonResponse
    {
       $data = $parentFormRequest->validated();
       $userId = auth()->user()->replid;

       $onlineChronologies = DB::table('online_kronologis')
           ->select('replid', 'iduser')
           ->where('replid', $data['online_kronologis_id'])
           ->where('idcalon', $data['replidcalonsiswa'])
           ->where('iduser', $userId)
           ->first();

           if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'user or online chronologies not found'
                ]
            ], 404));
        }

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
            'psikologisanak1' => $parentFormRequest->psikologisanak1,
            'psikologisanak2' => $parentFormRequest->psikologisanak2,
            'psikologisanak3' => $parentFormRequest->psikologisanak3,
            'psikologisanak4' => $parentFormRequest->psikologisanak4,
            'psikologisanak5' => $parentFormRequest->psikologisanak5,
            'psikologisanak6' => $parentFormRequest->psikologisanak6,
            'psikologisanak7' => $parentFormRequest->psikologisanak7,
            'psikologisanak8' => $parentFormRequest->psikologisanak8,
            'created_date' => Carbon::now('Asia/Jakarta'),
            'modified_date' => Carbon::now('Asia/Jakarta')
        ];

        DB::table('calonsiswa_form_ortu')->insert($data);

        return (new ParentFormResource($parentFormRequest))->response()->setStatusCode(201);
    }
}
