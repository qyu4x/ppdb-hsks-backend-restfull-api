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
        $data = [
            'id_online_kronologis' => $this->replid,
            'nama_cpd' => $this->namacalon
        ];

        if (isset($this->idcalon)) {
            $data['no_pendaftaran'] = $this->nopendaftaran;
            $data['biaya_formulir'] = $this->keu_assessment;
            $data['biaya_assessment'] = $this->keu_form;
        } else {
            $data['no_pendaftaran'] = null;
            $data['biaya_formulir'] = 'Belum Bayar';
            $data['biaya_assessment'] = 'Belum Bayar';
        }

        return $data;
    }
}
