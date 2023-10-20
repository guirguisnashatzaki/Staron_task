<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SupplierInvoice extends Model
{
    use HasFactory;

    protected $fillable = [
        'supplierId',
        'invoiceNumber',
        'invoiceDate',
        'totalAmount',
        'status',
    ];


    public function supplierAccount(){
        return $this->belongTo(SupplierAccount::class);
    }
}
