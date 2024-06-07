<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Recargas extends Model
{
    use HasFactory;

    protected $fillable = [
        'idextintor',
        'fecha',
        'proximarecarga',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'fecha' => 'date',
        'proximarecarga' => 'date',
    ];

    /**
     * Get the extinguisher associated with the recharge.
     */
    public function extintor()
    {
        return $this->belongsTo(Extintores::class, 'idextintor');
    }
}
