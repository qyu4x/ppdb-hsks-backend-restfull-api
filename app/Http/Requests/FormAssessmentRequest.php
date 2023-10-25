<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

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
            'online_kronologis_id' => ['required'],
            'replidcalonsiswa' => ['required'],
            'namadokter' => ['required', 'string'],
            'namapsikiater' => ['required', 'string'],
            'namaterapis1' => ['required', 'string'],
            'namaterapis2' => ['required', 'string'],
            'namaterapis3' => ['required', 'string'],
            'diagnosis' => ['required', 'string'],
            'keluhan' => ['required', 'string'],
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
            'sukubangsaayah' => ['required', 'string'],
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
            'faktoradopsi' => ['required', 'string'],
            'kesehatanhamil' => ['required', 'string'],
            'caesar' => ['required'],
            'hamilkaki' => ['required'],
            'kondisilahir' => ['required'],
            'kondisilahirdesc' => ['required', 'string'],
            'angkatkaki' => ['required'],
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
            'menamaiobjek' => ['required'],
            'bertanya' => ['required'],
            'sensoris' => ['required', 'string']
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response([
            'errors' => $validator->getMessageBag()
        ], status: 400));
    }
}
