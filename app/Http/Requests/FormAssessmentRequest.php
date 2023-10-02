<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class FormAssessmentRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return auth()->user() != null;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'replidcalonsiswa' => ['required'],
            'namadokter' => ['string'],
            'namapsikiater' => ['string'],
            'namaterapis1' => ['string'],
            'namaterapis2' => ['string'],
            'namaterapis3' => ['string'],
            'diagnosis' => ['string'],
            'keluhan' => ['string'],
            'pakaibaju' => ['required'],
            'bukabaju' => ['required'],
            'toilet' => ['required'],
            'sikatgigi' => ['required'],
            'cucitangan' => ['required'],
            'makansendiri' => ['required'],
            'resleting' => ['required'],
            'minum' => ['required'],
            'sepatu' => ['required'],
            'kaoskaki' => ['required'],
            'talisepatu' => ['required'],
            'sukubangsaayah' => ['required'],
            'anakkeayah' => ['required'],
            'anakdariayah' => ['required'],
            'kawinayah' => ['required'],
            'umurkawinayah' => ['required'],
            'sukubangsaibu' => ['required'],
            'anakkeibu' => ['required'],
            'anakdariibu' => ['required'],
            'kawinibu' => ['required'],
            'umurkawinibu' => ['required'],
            'adopsi' => ['required'],
            'faktoradopsi' => [],
            'kesehatanhamil' => [],
            'caesar' => ['required'],
            'hamilkaki' => ['required'],
            'kondisilahirdesc' => [],
            'angkatkepala' => ['required'],
            'berguling' => ['required'],
            'duduk' => ['required'],
            'merangkak' => ['required'],
            'merambat' => ['required'],
            'berjalan' => ['required'],
            'minumumur' => ['required'],
            'makan' => ['required'],
            'makansendok' => ['required'],
            'talisepatuumur' => ['required'],
            'toilettraining' => ['required'],
            'satukata' => ['required'],
            'gabungkata' => ['required'],
            'menambahobjek' => ['required'],
            'bertanya' => ['required'],
            'sensoris' => []
        ];
    }
}
