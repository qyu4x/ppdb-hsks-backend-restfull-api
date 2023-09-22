<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class UserRegisterRequest extends FormRequest
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
            'orang_tua.email' => ['required', 'email'],
            'orang_tua.hubungan' => ['required', 'string', 'in:Ayah,Ibu,Wali'],
            'orang_tua.nama' => ['required', 'string'],
            'orang_tua.handphone' => ['required', 'regex:/^[0-9+]+$/', 'max:15'],
            'orang_tua.whatsapp' => ['required', 'regex:/^[0-9+]+$/', 'max:15'],
            'calon_siswa.nama'=> ['required', 'string'],
            'calon_siswa.jenis_kelamin' => ['required', 'in:l,p'],
            'calon_siswa.tanggal_lahir' => ['required', 'date', 'before_or_equal:today'],
            'calon_siswa.abk' => ['required', 'boolean'],
            'calon_siswa.pemeriksaan_psikolog' => ['required', 'boolean'],
            'calon_siswa.jenjang' => ['required', 'string'],
            'calon_siswa.id_unit_bisnis' => ['required', 'integer'],
            'calon_siswa.id_tahun_ajaran' => ['required', 'integer'],
            'calon_siswa.id_tingkat' => ['required', 'integer'],
            'calon_siswa.id_kelompok_siswa' => ['required', 'integer'],
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response([
            'errors' => $validator->getMessageBag()
        ]));
    }
}
