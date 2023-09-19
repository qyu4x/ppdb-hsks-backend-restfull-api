<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class AcademicYearResource extends ResourceCollection
{
    /**
     * Transform the resource collection into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return parent::toArray($request);
        return [
            'replid' => $this->replid,
            'tahunajaran' => $this->tahunajaran,
            'departemen' => $this->departemen,
            'tglmulai' => $this->tglmulai,
            'tglakhir' => $this->tglakhir,
            'keterangan' => $this->keterangan,
            'created_at' => $this->created_at->timestamp,
            'updated_at' => $this->updated_at->timestamp,

        ];
    }
}
