<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderReturn extends Model
{
    protected $fillable = [
        'order_id',
        'reason',
        'description',
        'evidence_image',
        'refund_method',
        'bank_account',
        'bank_name',
        'status',
        'admin_note'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
} 