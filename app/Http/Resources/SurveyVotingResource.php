<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SurveyVotingResource extends JsonResource
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
            'head' => $this->head,
            'reff_kronologies' => $this->reff_kronologis,
            'reff_kronologies_sub' => $this->reff_kronologis_sub
        ];
    }
}
