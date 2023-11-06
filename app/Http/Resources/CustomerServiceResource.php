<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CustomerServiceResource extends JsonResource
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
            'company_code' => $this->company_code,
            'kode_cabang' => $this->kodecabang,
            'background_image' => $this->background_image,
            'nama' => $this->nama,
            'whatsapp_ppdb' => $this->wappdb,
            'whatsapp_ppdb2' => $this->wappdb2,
            'whatsapp_ppdb3' => $this->wappdb3
        ];
    }
}
