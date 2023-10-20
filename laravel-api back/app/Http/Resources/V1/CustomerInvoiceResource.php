<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class CustomerInvoiceResource extends JsonResource
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
            'invoiceId' => $this->id,
            'customerId' => $this ->customerId,
            'invoiceNumber' =>$this->invoiceNumber,
            'invoiceDate' => $this->invoiceDate,
            'totalAmount' => $this->totalAmount,
            'status' => $this->status,
            'dueDate' => $this->dueDate,
        ];
    }
}
