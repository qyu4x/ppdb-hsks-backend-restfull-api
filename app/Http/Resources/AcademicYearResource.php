<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AcademicYearResource extends JsonResource
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
            'replid' => $this->replid,
            'tahunajaran' => $this->tahunajaran,
            'departemen' => $this->departemen,
            'tglmulai' => $this->tglmulai,
            'tglakhir' => $this->tglakhir,
            'keterangan' => $this->keterangan,
        ];
    }
}
