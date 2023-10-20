<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;


class AccountResource extends JsonResource
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
            'accountId' => $this-> id,
            'accountNumber' => $this->accountNumber,
            'accountName' => $this->accountName,
            'accountType' => $this->accountType,
            'normalSide' => $this->normalSide,
            'balance' => $this->balance,
            'entries' => JournalEntryResource::collection($this->whenLoaded('entries')),
        ];
    }
}
