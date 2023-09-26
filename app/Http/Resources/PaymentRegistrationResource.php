<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PaymentRegistrationResource extends JsonResource
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
            'no_pendaftaran' => $this->no_pendaftaran,
            'nama_cpd' => $this->nama_cpd,
            'biaya_formulir' => $this->biaya_formulir,
            'biaya_assessment' => $this->biaya_assessment,
            'id_online_kronologis' => $this->id_online_kronologis
        ];
    }
}
