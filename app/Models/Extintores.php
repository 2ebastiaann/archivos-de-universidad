<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Extintores extends Model
{
    use HasFactory;


    protected $fillable = [
        'capacidad',
        'fechafabricacion',
        'estado',
        'idtipo',
        'idubicacion',
        'idproveedor',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'fechafabricacion' => 'date',
    ];

    /**
     * Get the type associated with the extinguisher.
     */
    public function tipo()
    {
        return $this->belongsTo(Tipos::class, 'idtipo');
    }

    /**
     * Get the location associated with the extinguisher.
     */
    public function ubicacion()
    {
        return $this->belongsTo(Ubicaciones::class, 'idubicacion');
    }

    /**
     * Get the provider associated with the extinguisher.
     */
    public function proveedor()
    {
        return $this->belongsTo(Proveedores::class, 'idproveedor');
    }
}
