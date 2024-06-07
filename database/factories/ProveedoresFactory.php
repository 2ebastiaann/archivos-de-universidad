<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Proveedores;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\proveedores>
 */
class ProveedoresFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Proveedores::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'nombre' => $this->faker->unique()->company,
            'telefono' => $this->faker->optional()->phoneNumber,
            'correo' => $this->faker->optional()->safeEmail,
        ];
    }
}
