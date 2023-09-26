<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Piloto;
use Illuminate\Support\Facades\DB;

class PilotosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('pilotos')->insert([
            ['nombre' => 'Max Verstappen','numero' => 1,'puntos' => 400,'fecha_nacimiento' => '1997-09-30','pais' => 'NED'],
            ['nombre' => 'Sergio Perez','numero' => 11,'puntos' => 223,'fecha_nacimiento' => '1990-01-26','pais' => 'MEX'],
            ['nombre' => 'Lewis Hamilton','numero' => 44,'puntos' => 190,'fecha_nacimiento' => '1985-01-07','pais' => 'GBR'],
            ['nombre' => 'Fernando Alonso','numero' => 14,'puntos' => 174,'fecha_nacimiento' => '1981-07-29','pais' => 'ESP'],
            ['nombre' => 'Carlos Sainz','numero' => 55,'puntos' => 150,'fecha_nacimiento' => '1994-09-01','pais' => 'ESP'],
            ['nombre' => 'Charles Leclerc','numero' => 16,'puntos' => 135,'fecha_nacimiento' => '1997-10-16','pais' => 'MON'],
            ['nombre' => 'Lando Norris','numero' => 4,'puntos' => 115,'fecha_nacimiento' => '1999-11-13','pais' => 'GBR'],
            ['nombre' => 'George Russell','numero' => 63,'puntos' => 115,'fecha_nacimiento' => '1998-02-15','pais' => 'GBR'],
            ['nombre' => 'Oscar Piastri','numero' => 81,'puntos' => 57,'fecha_nacimiento' => '2001-04-06','pais' => 'AUS'],
            ['nombre' => 'Lance Stroll','numero' => 18,'puntos' => 47,'fecha_nacimiento' => '1998-10-29','pais' => 'CAN'],
            ['nombre' => 'Pierre Gasly','numero' => 10,'puntos' => 46,'fecha_nacimiento' => '1996-02-07','pais' => 'FRA'],
            ['nombre' => 'Esteban Ocon','numero' => 31,'puntos' => 38,'fecha_nacimiento' => '1996-09-17','pais' => 'FRA'],
            ['nombre' => 'Alexander Albon','numero' => 23,'puntos' => 21,'fecha_nacimiento' => '1996-03-23','pais' => 'THA'],
            ['nombre' => 'Nico Hulkenberg','numero' => 27,'puntos' => 9,'fecha_nacimiento' => '1987-08-19','pais' => 'GER'],
            ['nombre' => 'Valtteri Bottas','numero' => 77,'puntos' => 6,'fecha_nacimiento' => '1989-08-28','pais' => 'FIN'],
            ['nombre' => 'Zhou Guanyu','numero' => 24,'puntos' => 4,'fecha_nacimiento' => '1999-05-30','pais' => 'CHN'],
            ['nombre' => 'Yuki Tsunoda','numero' => 22,'puntos' => 3,'fecha_nacimiento' => '2000-05-11','pais' => 'JPN'],
            ['nombre' => 'Kevin Magnussen','numero' => 20,'puntos' => 3,'fecha_nacimiento' => '1992-10-05','pais' => 'DEN'],
            ['nombre' => 'Liam Lawson','numero' => 40,'puntos' => 2,'fecha_nacimiento' => '2002-02-11','pais' => 'NZL'],
            ['nombre' => 'Logan Sargeant','numero' => 2,'puntos' => 0,'fecha_nacimiento' => '2000-12-31','pais' => 'USA'],
        ]);
    }
}
