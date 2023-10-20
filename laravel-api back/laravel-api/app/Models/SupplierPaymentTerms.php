<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SupplierPaymentTerms extends Model
{
    use HasFactory;

    protected $fillable = [
        'termName',
        'dueDays',
        'discountPercentage',
    ];
}
