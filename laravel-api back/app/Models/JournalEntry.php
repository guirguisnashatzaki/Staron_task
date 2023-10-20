<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JournalEntry extends Model
{
    use HasFactory;

    protected $fillable = [
        'date',
        'accountId',
        'debit',
        'credit',
        'description'
    ];

    public function customer(){
        return $this->belongsTo(Account::class);
    }
}
