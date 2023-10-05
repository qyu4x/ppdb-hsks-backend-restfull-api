<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StudentCandidatesAvailableDataResource extends JsonResource
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
            'id_calon_siswa' => $this->replid,
            'nama' => $this->nama,
            'jenis_kelamin' => $this->kelamin,
            'tanggal_lahir' => $this->tgllahir,
        ];
    }
}
