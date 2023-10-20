<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class CustomerPaymentsTermResource extends JsonResource
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
            'termId'=> $this->id,
            'termName'=> $this->termName,
            'dueDays'=> $this->dueDays,
            'discountPercentage'=> $this->discountPercentage,
        ];
    }
}
