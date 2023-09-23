<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class OnlineChronologiesPreviewResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->replid,
            'ortu' => $this->ortu,
            'namaortu' => $this->namaortu,
            'handphoneortu' => $this->handphoneortu,
            'whatsapportu' => $this->whatsapportu,
            'emailortu' => $this->emailortu,
            'namacalon' => $this->namacalon,
            'jeniskelamin' => $this->jeniskelamin,
            'tanggallahir' => $this->tanggallahir,
            'abk' => $this->abk,
            'pemeriksaan_psikolog' => $this->pemeriksaan_psikolog,
            'namaunitbisnis' => $this->nama,
            'tahunajaran' => $this->tahunajaran,
            'departemen' => $this->departemen,
            'tingkat' => $this->tingkat,
            'kelompok' => $this->kelompok,
            'email' => $this->email,
            'tokenonline' => $this->tokenonline,
            'iduser' => $this->iduser,
            'hrm_company_email' => $this->hrm_company_email,
            'wappdb' => $this->wappdb,
            'wappdb2' => $this->wappdb2,
            'wappdb3' => $this->wappdb3,
            'phone' => $this->phone,
            'created_date' => $this->created_date,
            'modified_date' => $this->modified_date
            ];
    }
}
