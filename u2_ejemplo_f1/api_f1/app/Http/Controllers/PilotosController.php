<?php

namespace App\Http\Controllers;

use App\Models\Piloto;
use Illuminate\Http\Request;
use App\Http\Requests\PilotosRequest;

class PilotosController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //sleep(3);
        return Piloto::all();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(PilotosRequest $request)
    {
        $piloto = new Piloto();
        $piloto->nombre = $request->nombre;
        $piloto->numero = $request->numero;
        $piloto->puntos = $request->puntos;
        $piloto->fecha_nacimiento = $request->fecha_nacimiento;
        $piloto->pais = $request->pais;
        $piloto->save();
        return $piloto;
    }

    /**
     * Display the specified resource.
     */
    public function show(Piloto $piloto)
    {
        return $piloto;
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Piloto $piloto)
    {
        $piloto->nombre = $request->nombre;
        $piloto->numero = $request->numero;
        $piloto->puntos = $request->puntos;
        $piloto->fecha_nacimiento = $request->fecha_nacimiento;
        $piloto->pais = $request->pais;
        return $piloto->save();
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Piloto $piloto)
    {
        $piloto->delete();
    }
}
