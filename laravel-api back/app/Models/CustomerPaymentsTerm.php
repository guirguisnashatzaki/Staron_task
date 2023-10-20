<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerPaymentsTerm extends Model
{
    use HasFactory;

    protected $fillable = [
        'termName',
        'dueDays',
        'discountPercentage',
    ];
}
