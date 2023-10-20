<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerAccount extends Model
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

    public function customerInvoices(){
        return $this->hasMany(CustomerInvoice::class);
    }
}
