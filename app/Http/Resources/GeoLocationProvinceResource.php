<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GeoLocationProvinceResource extends JsonResource
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
            'province' => $this->propinsi
        ];
    }
}
