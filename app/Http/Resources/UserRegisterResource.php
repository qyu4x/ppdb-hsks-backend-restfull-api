<?php

namespace App\Http\Resources;

use http\Client\Curl\User;
use Illuminate\Http\Resources\Json\JsonResource;

class UserRegisterResource extends JsonResource
{

    private $user = [];
    private $onlineChronologies = [];

    public function __construct($user, $onlineChronologies)
    {
        parent::__construct(null);
        $this->user = $user;
        $this->onlineChronologies = $onlineChronologies;
    }


    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'user' => new UserResource($this->user),
            'online_kronologis' => new OnlineChronologiesUserAuthResource($this->onlineChronologies),
        ];
    }
}
