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
            'idonlinekronologis' => ['required', 'numeric'],
            'idcalon' => ['required', 'numeric'],
            'nik_siswa'=> ['required', 'string', 'regex:/^[0-9+]+$/'],
            'nama'=> ['required', 'string'],
            'panggilan'=> ['required', 'string'],
            'kelamin'=> ['required', 'string', "in:p,l"],
            'tmplahir'=> ['required', 'string'],
            'tgllahir'=> ['required', 'string'],
            'agama'=> ['required', 'string'],
            'warga'=> ['required', 'string'],
            'anakke'=> ['required', 'integer'],
            'jsaudara'=> ['required', 'integer'],
            'statanak' => ['required', 'string', "in:Anak Kandung, Anak Asuh, Anak Tiri"],
            'bahasa' => ['required', 'string'],
            'negara' => ['required', 'string'],
            'provinsi' => ['required', 'string'],
            'kota' => ['required', 'string'],
            'kecamatan' => ['required', 'string'],
            'alamatsiswa' => ['required', 'string'],
            'kodepossiswa' => ['required', 'string'],
            'idtempattinggal' => ['required', 'numeric'],
            'telponsiswa' => ['required', 'string', 'regex:/^[0-9+]+$/', 'max:15'],
            'hpsiswa' => ['required', 'string', 'regex:/^[0-9+]+$/', 'max:15'],
            'whatsappsiswa' => ['required', 'string', 'regex:/^[0-9+]+$/', 'max:15'], // pakai bbm
            'emailsiswa' => ['required', 'string', 'email'],
            'berat' => ['required', 'numeric'],
            'tinggi' => ['required', 'numeric'],
            'darah' => ['required', 'string'],
            'lingkarkepala' => ['required', 'numeric'],
            'jenjangasal' => ['required', 'string'],
            'asalsekolah' => ['string'],
            'tingkat' => ['numeric'],
            'jenjangakhir' => ['required', 'string'],
            'sekolahjenjang' => ['required', 'string'],
            'kps' => ['required', 'boolean'],
            'no_kps' => ['required'],
            'piplayak' => ['required', 'boolean'],
            'kip'=> ['required', 'boolean'],
            'no_kip' => ['required'],
            'almayah' => ['required'],
            'almibu' => ['required', 'boolean'],
            'wali_opt' => ['required', 'boolean']
        ];

    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response([
            'errors' => $validator->getMessageBag()
        ], status: 400));
    }
}
