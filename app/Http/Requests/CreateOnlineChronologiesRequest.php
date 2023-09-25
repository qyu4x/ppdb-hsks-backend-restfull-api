<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class CreateOnlineChronologiesRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'nama'=> ['required', 'string'],
            'jenis_kelamin' => ['required', 'in:l,p'],
            'tanggal_lahir' => ['required', 'date', 'before_or_equal:today'],
            'abk' => ['required', 'boolean'],
            'pemeriksaan_psikolog' => ['required', 'boolean'],
            'jenjang' => ['required', 'string'],
            'id_unit_bisnis' => ['required', 'integer'],
            'id_tahun_ajaran' => ['required', 'integer'],
            'id_tingkat' => ['required', 'integer'],
            'id_kelompok_siswa' => ['required', 'integer'],
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response([
            'errors' => $validator->getMessageBag()
        ]));
    }
}
