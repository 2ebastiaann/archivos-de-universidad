<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;
use App\Models\Ubicaciones;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ubicaciones>
 */
class UbicacionesFactory extends Factory
{
     /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Ubicaciones::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $nombre = $this->faker->randomElement(['Salon', 'Sala']) . ' ' . $this->faker->numberBetween(1, 100);

        return [
            'nombre' => $nombre,
        ];
    }
}
