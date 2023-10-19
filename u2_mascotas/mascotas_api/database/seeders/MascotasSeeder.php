<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MascotasSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //vaciar la tabla si es que tiene datos
        DB::table('mascotas')->truncate();

        //insertar datos
        DB::table('mascotas')->insert([
            ['especie'=>'Perro', 'raza'=>'Pug', 'nombre'=>'Frank', 'sexo'=>'M', ],
            ['especie'=>'Gato', 'raza'=>'Mestizo', 'nombre'=>'Depredador', 'sexo'=>'M', ],
            ['especie'=>'Gato', 'raza'=>'Siamés', 'nombre'=>'Cucha', 'sexo'=>'F', ],
            ['especie'=>'Perro', 'raza'=>'Terrier Chileno', 'nombre'=>'Karü', 'sexo'=>'F', ],
            ['especie'=>'Perro', 'raza'=>'Pastor Alemán', 'nombre'=>'Baloo', 'sexo'=>'M', ],
            ['especie'=>'Gato', 'raza'=>'Mestizo', 'nombre'=>'Eevee', 'sexo'=>'M', ],
            ['especie'=>'Perro', 'raza'=>'Beagle', 'nombre'=>'Leia', 'sexo'=>'F', ],
            ['especie'=>'Gato', 'raza'=>'Majin Boo', 'nombre'=>'Lila', 'sexo'=>'F', ],

        ]);
    }
}
