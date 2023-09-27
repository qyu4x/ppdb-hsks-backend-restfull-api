<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class ParentFormRequest extends FormRequest
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
            'alasan' => ['required', 'string'],
            'gambarananak' => ['required','string'],
            'hambatananak' => ['required', 'string'],
            'pengalamananak' => ['required', 'string'],
            'hubungansaudara' => ['required', 'string'],
            'peraturananak' => ['required', 'string'],
            'peranortu' => ['required', 'string'],
            'responanak' => ['required', 'string'],
            'harapanortu_tutor' => ['required', 'string'],
            'harapanortu_pendidikan' => ['required', 'string'],
            'psikologianak1' => $this->psikologi_anak1,
            'psikologianak2' => $this->psikologi_anak2,
            'psikologianak3' => $this->psikologi_anak3,
            'psikologianak4' => $this->psikologi_anak4,
            'psikologianak5' => $this->psikologi_anak5,
            'psikologianak6' => $this->psikologi_anak6,
            'psikologianak7' => $this->psikologi_anak7,
            'psikologianak8' => $this->psikologi_anak8,
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response([
            'errors' => $validator->getMessageBag()
        ]));
    }
}
