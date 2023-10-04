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
            'alasan' => $this->alasan,
            'gambaran_anak' => $this->gambarananak,
            'hambatan_anak' => $this->hambatananak,
            'pengalaman_anak' => $this->pengalamananak,
            'hubungan_saudara' => $this->hubungansaudara,
            'peraturan_anak' => $this->peraturananak,
            'peran_ortu' => $this->peranortu,
            'respon_anak' => $this->responanak,
            'harapan_ortu_tutor' => $this->harapanortu_tutor,
            'harapan_ortu_pendidikan' => $this->harapanortu_pendidikan,
            'psikologi_anak1' => $this->psikologianak1,
            'psikologi_anak2' => $this->psikologianak2,
            'psikologi_anak3' => $this->psikologianak3,
            'psikologi_anak4' => $this->psikologianak4,
            'psikologi_anak5' => $this->psikologianak5,
            'psikologi_anak6' => $this->psikologianak6,
            'psikologi_anak7' => $this->psikologianak7,
            'psikologi_anak8' => $this->psikologianak8,
        ];
    }
}
