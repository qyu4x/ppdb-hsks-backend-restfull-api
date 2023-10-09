<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SchoolResource extends JsonResource
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
            'company_code' => $this->company_code,
            'kode_cabang' => $this->kodecabang,
            'nama' => $this->nama,
            'street' =>  $this->street,
            'city' => $this->city,
            'zip' => $this->zip,
            'country' => $this->country,
            'phone' => $this->phone,
            'mobile' => $this->mobile,
            'website' => $this->website,
            'fax' => $this->fax,
            'email' => $this->email,
            'whatsapp' => $this->whatsapp,
            'wa_ppdb' => $this->wappdb,
            'background_image' => $this->background_image,
            'logo' => $this->logo,
            'jenis_pendidikan' => $this->jenis_pendidikan,
            'departments' => DepartmentResource::collection($this->departments),
            'programs' => $this->programs
        ];
    }
}
