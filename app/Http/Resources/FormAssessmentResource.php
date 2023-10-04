<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class FormAssessmentResource extends JsonResource
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
            'replidcalonsiswa' => $this->replidcalonsiswa,
            'namadokter' => $this->namadokter,
            'namapsikiater' => $this->namapsikiater,
            'namaterapis1' => $this->namaterapis1,
            'namaterapis2' => $this->namaterapis2,
            'namaterapis3' => $this->namaterapis3,
            'diagnosis' => $this->diagnosis,
            'keluhan' => $this->keluhan,
            'pakaibaju' => $this->pakaibaju,
            'bukabaju' => $this->bukabaju,
            'toilet' => $this->toilet,
            'sikatgigi' => $this->sikatgigi,
            'cucitangan' => $this->cucitangan,
            'makansendiri' => $this->makansendiri,
            'resleting' => $this->resleting,
            'minum' => $this->minum,
            'sepatu' => $this->sepatu,
            'kaoskaki' => $this->kaoskaki,
            'talisepatu' => $this->talisepatu,
            'sukubangsaayah' => $this->sukubangsaayah,
            'anakkeayah' => $this->anakkeayah,
            'anakdariayah' => $this->anakdariayah,
            'kawinayah' => $this->kawinayah,
            'umurkawinayah' => $this->umurkawinayah,
            'sukubangsaibu' => $this->sukubangsaibu,
            'anakkeibu' => $this->anakkeibu,
            'anakdariibu' => $this->anakdariibu,
            'kawinibu' => $this->kawinibu,
            'umurkawinibu' => $this->umurkawinibu,
            'adopsi' => $this->adopsi,
            'faktoradopsi' => $this->faktoradopsi,
            'kesehatanhamil' => $this->kesehatanhamil,
            'caesar' => $this->caesar,
            'hamilkaki' => $this->hamilkaki,
            'kondisilahir' => $this->kondisilahir,
            'kondisilahirdesc' => $this->kondisilahirdesc,
            'angkatkaki' => $this->angkatkaki,
            'berguling' => $this->berguling,
            'duduk' => $this->duduk,
            'merangkak' => $this->merangkak,
            'merambat' => $this->merambat,
            'berjalan' => $this->berjalan,
            'minumumur' => $this->minumumur,
            'makan' => $this->makan,
            'makansendok' => $this->makansendok,
            'talisepatuumur' => $this->talisepatuumur,
            'toilettraining' => $this->toilettraining,
            'satukata' => $this->satukata,
            'gabungkata' => $this->gabungkata,
            'menamaiobjek' => $this->menamaiobjek,
            'bertanya' => $this->bertanya,
            'sensoris' => $this->sensoris,
        ];
    }
}
