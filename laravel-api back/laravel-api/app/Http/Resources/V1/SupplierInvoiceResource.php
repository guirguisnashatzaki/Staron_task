<?php

namespace App\Http\Resources\V1;

use Illuminate\Http\Resources\Json\JsonResource;

class SupplierInvoiceResource extends JsonResource
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
            'supplierId' => $this ->supplierId,
            'invoiceNumber' =>$this->invoiceNumber,
            'invoiceDate' => $this->invoiceDate,
            'totalAmount' => $this->totalAmount,
            'status' => $this->status,
        ];
    }
}
