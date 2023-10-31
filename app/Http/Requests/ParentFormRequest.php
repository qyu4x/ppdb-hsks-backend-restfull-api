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
            'online_kronologis_id' => ['required'],
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
            'psikologisanak1' => ['required'],
            'psikologisanak2' => ['required'],
            'psikologisanak3' => ['required'],
            'psikologisanak4' => ['required'],
            'psikologisanak5' => ['required'],
            'psikologisanak6' => ['required'],
            'psikologisanak7' => ['required'],
            'psikologisanak8' => ['required']
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response([
            'errors' => $validator->getMessageBag()
        ], status: 400));
    }
}
