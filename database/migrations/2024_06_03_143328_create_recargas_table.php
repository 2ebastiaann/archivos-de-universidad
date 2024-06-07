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
        Schema::create('recargas', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('idextintor');
            $table->date('fecha');
            $table->date('proximarecarga');
            $table->timestamps();

            $table->foreign('idextintor')->references('id')->on('extintores');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('recargas');
    }
};
