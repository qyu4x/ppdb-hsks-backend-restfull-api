<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class SurveyResource extends JsonResource
{

    private $voting;
    private $reason;
    private $media;

    /**
     * @param $voting
     * @param $reason
     * @param $media
     */

    public function __construct($voting, $reason, $media)
    {
        parent::__construct(null);
        $this->voting = $voting;
        $this->reason = $reason;
        $this->media = $media;
    }

    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'voting' => SurveyVotingResource::collection($this->voting),
            'reason' => SurveyReasonResource::collection($this->reason),
            'media' => SurveyMediaResource::collection($this->media)
        ];
    }
}
