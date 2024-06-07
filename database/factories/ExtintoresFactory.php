<?php

namespace Database\Factories;
use App\Models\Extintores;
use App\Models\Tipos; // Importa el modelo Tipos
use App\Models\Ubicaciones; // Importa el modelo Ubicaciones
use App\Models\Proveedores;
use Illuminate\Database\Eloquent\Factories\Factory;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\extintores>
 */
class ExtintoresFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Extintores::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'capacidad' => $this->faker->numberBetween(1, 10),
            'fechafabricacion' => $this->faker->date(),
            'estado' => $this->faker->randomElement(['nuevo', 'usado', 'reparado']),
            'idtipo' => $this->faker->numberBetween(1, 5), // Generar un número aleatorio entre 1 y 5
            'idubicacion' => $this->faker->numberBetween(1, 10), 
        ];
    }
}
