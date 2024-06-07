<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Inspecciones extends Model
{
    use HasFactory;

    protected $fillable = [
        'idextintor',
        'fecha',
        'proximainspeccion',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'fecha' => 'date',
        'proximainspeccion' => 'date',
    ];

    /**
     * Get the extinguisher associated with the inspection.
     */
    public function extintor()
    {
        return $this->belongsTo(Extintores::class, 'idextintor');
    }
}
