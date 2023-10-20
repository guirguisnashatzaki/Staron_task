<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class CustomerAccountResource extends JsonResource
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
            'customerId' => $this ->id,
            'accountNumber' =>$this->accountNumber,
            'accountName' => $this->accountName,
            'contactName' => $this->contactName,
            'email' => $this->email,
            'phone' => $this->phone,
            'address' => $this->address
        ];
    }
}
