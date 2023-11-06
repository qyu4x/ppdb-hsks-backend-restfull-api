<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\FormAssessmentRequest;
use App\Http\Resources\FormAssessmentResource;
use App\Http\Resources\FormAssessmentResourceCollection;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;
use Carbon\Carbon;


class FormAssessmentController extends Controller
{
    public function createAssessmentForm(FormAssessmentRequest $formAssessmentRequest) : JsonResponse
    {
        $data = $formAssessmentRequest->validated();
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
            'replidcalonsiswa' => $formAssessmentRequest->replidcalonsiswa,
            'namadokter' => $formAssessmentRequest->namadokter,
            'namapsikiater' => $formAssessmentRequest->namapsikiater,
            'namaterapis1' => $formAssessmentRequest->namaterapis1,
            'namaterapis2' => $formAssessmentRequest->namaterapis2,
            'namaterapis3' => $formAssessmentRequest->namaterapis3,
            'diagnosis' => $formAssessmentRequest->diagnosis,
            'keluhan' => $formAssessmentRequest->keluhan,
            'pakaibaju' => $formAssessmentRequest->pakaibaju,
            'bukabaju' => $formAssessmentRequest->bukabaju,
            'toilet' => $formAssessmentRequest->toilet,
            'sikatgigi' => $formAssessmentRequest->sikatgigi,
            'cucitangan' => $formAssessmentRequest->cucitangan,
            'makansendiri' => $formAssessmentRequest->makansendiri,
            'resleting' => $formAssessmentRequest->resleting,
            'minum' => $formAssessmentRequest->minum,
            'sepatu' => $formAssessmentRequest->sepatu,
            'kaoskaki' => $formAssessmentRequest->kaoskaki,
            'talisepatu' => $formAssessmentRequest->talisepatu,
            'sukubangsaayah' => $formAssessmentRequest->sukubangsaayah,
            'anakkeayah' => $formAssessmentRequest->anakkeayah,
            'anakdariayah' => $formAssessmentRequest->anakdariayah,
            'kawinayah' => $formAssessmentRequest->kawinayah,
            'umurkawinayah' => $formAssessmentRequest->umurkawinayah,
            'sukubangsaibu' => $formAssessmentRequest->sukubangsaibu,
            'anakkeibu' => $formAssessmentRequest->anakkeibu,
            'anakdariibu' => $formAssessmentRequest->anakdariibu,
            'kawinibu' => $formAssessmentRequest->kawinibu,
            'umurkawinibu' => $formAssessmentRequest->umurkawinibu,
            'adopsi' => $formAssessmentRequest->adopsi,
            'faktoradopsi' => $formAssessmentRequest->faktoradopsi,
            'kesehatanhamil' => $formAssessmentRequest->kesehatanhamil,
            'caesar' => $formAssessmentRequest->caesar,
            'hamilkaki' => $formAssessmentRequest->hamilkaki,
            'kondisilahir' => $formAssessmentRequest->kondisilahir,
            'kondisilahirdesc' => $formAssessmentRequest->kondisilahirdesc,
            'angkatkaki' => $formAssessmentRequest->angkatkaki,
            'berguling' => $formAssessmentRequest->berguling,
            'duduk' => $formAssessmentRequest->duduk,
            'merangkak' => $formAssessmentRequest->merangkak,
            'merambat' => $formAssessmentRequest->merambat,
            'berjalan' => $formAssessmentRequest->berjalan,
            'minumumur' => $formAssessmentRequest->minumumur,
            'makan' => $formAssessmentRequest->makan,
            'makansendok' => $formAssessmentRequest->makansendok,
            'talisepatuumur' => $formAssessmentRequest->talisepatuumur,
            'toilettraining' => $formAssessmentRequest->toilettraining,
            'satukata' => $formAssessmentRequest->satukata,
            'gabungkata' => $formAssessmentRequest->gabungkata,
            'menamaiobjek' => $formAssessmentRequest->menamaiobjek,
            'bertanya' => $formAssessmentRequest->bertanya,
            'sensoris' => $formAssessmentRequest->sensoris,
            'created_date' => Carbon::now('Asia/Jakarta'),
            'modified_date' => Carbon::now('Asia/Jakarta')
        ];

        DB::table('calonsiswa_form_assessment')->insert($data);

        return (new FormAssessmentResource($formAssessmentRequest))->response()->setStatusCode(201)
            ->header('Content-Type', 'application/json');

    }
}
