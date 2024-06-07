<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Inspecciones;
use App\Models\Extintores;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\inspecciones>
 */
class InspeccionesFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Inspecciones::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'idextintor' => Extintores::factory()->create()->id,  // Crea un extintor y obtén su ID
            'fecha' => $this->faker->date(),
            'proximainspeccion' => $this->faker->dateTimeBetween('now', '+1 year')->format('Y-m-d'),
        ];
    }
}
