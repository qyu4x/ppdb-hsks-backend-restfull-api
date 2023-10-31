<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;

class OnlineChronologiesUserAuthResource extends JsonResource
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
           'id' => $this->replid,
           'hubungan' => $this->ortu,
           'nama_ortu' => $this->namaortu,
           'handphone_ortu' => $this->handphoneortu,
           'email_ortu' => $this->emailortu,
           'whatsapp_ortu' => $this->whatsapportu,
           'nama_calon' => $this->namacalon,
           'jenis_kelamin' => $this->jeniskelamin,
           'tanggal_lahir' => Carbon::parse($this->tanggallahir)->format('Y-m-d'),
           'abk' => $this->abk,
           'pemeriksaan_psikolog' => $this->pemeriksaan_psikolog,
           'jenjang' => $this->jenjang,
           'id_tingkat' => $this->idtingkat,
           'id_unit_bisnis' => $this->idunitbisnis,
           'id_tahun_ajaran' => $this->idtahunajaran,
           'id_kelompok_calon' => $this->idkelompokcalon,
           'token_online' => $this->tokenonline,
           'status' => $this->status,
           'created_date' => $this->created_date,
           'modified_date' => $this->modified_date
       ];
    }
}
