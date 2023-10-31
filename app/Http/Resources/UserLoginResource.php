<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UserLoginResource extends JsonResource
{

    private $user = [];
    private $onlineChronologies = [];

    private $token = [];

    public function __construct($user, $onlineChronologies, $token)
    {
        parent::__construct(null);
        $this->user = $user;
        $this->onlineChronologies = $onlineChronologies;
        $this->token = $token;
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
            'user' => new UserResource($this->user),
            'online_kronologis' => new OnlineChronologiesUserAuthResource($this->onlineChronologies),
            'token' => new JwtTokenResource($this->token)
        ];
    }
}
