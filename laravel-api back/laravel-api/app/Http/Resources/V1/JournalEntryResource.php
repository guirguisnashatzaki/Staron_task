<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class JournalEntryResource extends JsonResource
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
            'entryId'=>$this->id,
            'date'=>$this->date,
            'accountId'=>$this->accountId,
            'debit'=>$this->debit,
            'credit'=>$this->credit,
            'description'=>$this->description,
        ];
    }
}