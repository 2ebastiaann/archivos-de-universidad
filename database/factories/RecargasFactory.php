<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Recargas;
use App\Models\Extintores;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\recargas>
 */
class RecargasFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Recargas::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'idextintor' => Extintores::inRandomOrder()->value('id'),  // Obtén el ID de un extintor aleatorio
            'fecha' => $this->faker->date(),
            'proximarecarga' => $this->faker->dateTimeBetween('now', '+1 year')->format('Y-m-d'),
        ];
    }
}
