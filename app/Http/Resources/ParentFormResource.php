<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ParentFormResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'replidcalonsiswa'=> $this->replidcalonsiswa,
            'alasan' => $this->alasan,
            'gambarananak' => $this->gambarananak,
            'hambatananak' => $this->hambatananak,
            'pengalamananak' => $this->pengalamananak,
            'hubungansaudara' => $this->hubungansaudara,
            'peraturananak' => $this->peraturananak,
            'peranortu' => $this->peranortu,
            'responanak' => $this->responanak,
            'harapanortu_tutor' => $this->harapanortu_tutor,
            'harapanortu_pendidikan' => $this->harapanortu_pendidikan,
            'psikologisanak1' => $this->psikologisanak1,
            'psikologisanak2' => $this->psikologisanak2,
            'psikologisanak3' => $this->psikologisanak3,
            'psikologisanak4' => $this->psikologisanak4,
            'psikologisanak5' => $this->psikologisanak5,
            'psikologisanak6' => $this->psikologisanak6,
            'psikologisanak7' => $this->psikologisanak7,
            'psikologisanak8' => $this->psikologisanak8,
        ];
    }
}
