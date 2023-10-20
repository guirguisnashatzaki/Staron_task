<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SupplierAccount extends Model
{
    use HasFactory;


    protected $fillable = [
        'accountNumber',
        'accountName',
        'contactName',
        'email',
        'phone',
        'address'
    ];

    public function supplierInvoices(){
        return $this->hasMany(SupplierInvoice::class);
    }
}
