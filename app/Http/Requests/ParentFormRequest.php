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
            'psikologianak1' => ['required'],
            'psikologianak2' => ['required'],
            'psikologianak3' => ['required'],
            'psikologianak4' => ['required'],
            'psikologianak5' => ['required'],
            'psikologianak6' => ['required'],
            'psikologianak7' => ['required'],
            'psikologianak8' => ['required']
        ];
    }

    protected function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(response([
            'errors' => $validator->getMessageBag()
        ]));
    }
}
