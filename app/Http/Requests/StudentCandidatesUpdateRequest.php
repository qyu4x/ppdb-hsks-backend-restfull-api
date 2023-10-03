<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class StudentCandidatesUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'idkelompok'=> ['required', 'string'],
            'nik'=> ['required', 'string'],
            'nama'=> ['required', 'string'],
            'paggilan'=> ['required', 'string'],
            'kelamin'=> ['required', 'string'],
            'tmplahir'=> ['required', 'string'],
            'tgllahir'=> ['required', 'string'],
            'agama'=> ['required', 'string'],
            'warga'=> ['required', 'string'], // apakah kewarganegaraan?
            'anakke'=> ['required', 'integer'],
            'jsaudara'=> ['required', 'integer'],
            'status' => ['required', 'string'],// apakah status anak,
            'bahasa' => ['required', 'string'],
            'negara' => ['required', 'string'],
            'provinsi' => ['required', 'string'],
            'kota' => ['required', 'string'],
            'kecamatan' => ['required', 'string'],
            'alamatsiswa' => ['required', 'string'], // apakah region meruapakan alamat,
            'kodepossiswa' => ['required', 'string'],
            // id tempat tinggal dimana,
            'telponsiswa' => ['required', 'string'],
            // handphone dimana
            // whatsapp dimana
            'email' => ['required', 'string', 'email'],
            'berat' => ['required', 'numeric'],
            'tinggi' => ['required', 'numeric'],
            'darah' => ['required', 'string'],
            // pendidikan terakhir dan jenjang terakgir belom

            //
            'kps' => ['required'],
            'no_kps' => ['required'],
            'piplayak' => ['required'],
            'kip'=> ['required'],
            'no_kip' => ['required'],
            'almayah' => ['required'],
            'almibu' => ['required'],
            'wali_opt' => [] // apakah memiliki wali?

        ];

    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response([
            'errors' => $validator->getMessageBag()
        ]));
    }
}
