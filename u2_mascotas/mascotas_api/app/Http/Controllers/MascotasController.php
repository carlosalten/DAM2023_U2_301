<?php

namespace App\Http\Controllers;

use App\Models\Mascota;
use Illuminate\Http\Request;

class MascotasController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return Mascota::orderBy('nombre')->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $mascota = new Mascota();
        $mascota->especie = $request->especie;
        $mascota->raza = $request->raza;
        $mascota->nombre = $request->nombre;
        $mascota->fecha_nacimiento = $request->fecha_nacimiento;
        $mascota->sexo = $request->sexo;
        $mascota->save();
        return $mascota;
    }

    /**
     * Display the specified resource.
     */
    public function show(Mascota $mascota)
    {
        return $mascota;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Mascota $mascota)
    {
        $mascota->especie = $request->especie;
        $mascota->raza = $request->raza;
        $mascota->nombre = $request->nombre;
        $mascota->fecha_nacimiento = $request->fecha_nacimiento;
        $mascota->sexo = $request->sexo;
        $mascota->save();
        return $mascota;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Mascota $mascota)
    {
        return $mascota->delete();
    }
}
