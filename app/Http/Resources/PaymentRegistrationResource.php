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
            'id_online_kronologis' => $this->idonlinekronologis,
            'nama_cpd' => $this->namacalon
        ];

        if (isset($this->idcalon)) {
            $data['id_calon_siswa'] = $this->idcalonsiswa;
            $data['no_pendaftaran'] = $this->nopendaftaran;
            $data['biaya_formulir'] = $this->keu_assessment;
            $data['biaya_assessment'] = $this->keu_form;
        } else {
            $data['id_calon_siswa'] = null;
            $data['no_pendaftaran'] = null;
            $data['biaya_formulir'] = 'Belum Bayar';
            $data['biaya_assessment'] = 'Belum Bayar';
        }

        return $data;
    }
}
