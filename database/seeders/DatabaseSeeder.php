<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UbicacionesSeeder::class);
        $this->call(ProveedoresSeeder::class);
        $this->call(TiposSeeder::class);
        $this->call(ExtintoresSeeder::class);
        $this->call(InspeccionesSeeder::class);
        $this->call(RecargasSeeder::class);
        $this->call(UserSeeder::class);
    }
}
