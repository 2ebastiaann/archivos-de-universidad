<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(): void
    {
        Schema::create('extintores', function (Blueprint $table) {
            //datos independientes
            $table->id();
            $table->unsignedBigInteger('capacidad');
            $table->date('fechafabricacion');
            $table->string('estado', 50);

            //datos dependientes
            $table->unsignedBigInteger('idtipo');
            $table->unsignedBigInteger('idubicacion');
            $table->unsignedBigInteger('idproveedor');
            $table->timestamps();

            $table->foreign('idtipo')->references('id')->on('tipos');
            $table->foreign('idubicacion')->references('id')->on('ubicaciones');
            $table->foreign('idproveedor')->references('id')->on('proveedores');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('extintores');
    }
};
