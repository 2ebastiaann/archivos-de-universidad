<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UbicacionesController;
use App\Http\Controllers\TiposController;
use App\Http\Controllers\ProveedoresController;
use App\Http\Controllers\ExtintoresController;
use App\Http\Controllers\RecargasController;
use App\Http\Controllers\InspeccionesController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get("saludar",function(){
    return json_encode(["msg" => "bienvenido"]);
});

Route::resource("usuario", UserController::class);
Route::resource("ubicaciones", UbicacionesController::class);
Route::resource("tipos", TiposController::class);
Route::resource("proveedores", ProveedoresController::class);
Route::resource("extintores", ExtintoresController::class);
Route::resource("recargas", RecargasController::class);
Route::resource("inspecciones", InspeccionesController::class);

