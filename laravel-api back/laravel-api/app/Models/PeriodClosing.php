<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PeriodClosing extends Model
{
    use HasFactory;

    protected $fillable = [
        'startDate',
        'endDate',
        'status',
    ];
}
