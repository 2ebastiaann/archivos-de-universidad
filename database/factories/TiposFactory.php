<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Tipos;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\tipos>
 */
class TiposFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Tipos::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $nombres = ['verde', 'rojo', 'azul', 'amarillo', 'negro'];
        return [
            'nombre' => $this->faker->unique()->randomElement($nombres),
        ];
    }
}
