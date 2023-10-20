<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerInvoice extends Model
{
    use HasFactory;

    protected $fillable = [
        'customerId',
        'invoiceNumber',
        'invoiceDate',
        'totalAmount',
        'status',
        'dueDate'
    ];

    public function cutomerAccount(){
        return $this->belongsTo(CustomerAccount::class);
    }
}
