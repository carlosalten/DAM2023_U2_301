import 'dart:collection';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mascotas_cliente/models/mascota.dart';

class HttpService {
  final String apiUrl = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> mascotas() async {
    var respuesta = await http.get(Uri.parse(apiUrl + '/mascotas'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    }
    print(respuesta.statusCode);
    return [];
  }

  Future<LinkedHashMap<String, dynamic>> mascotasAgregar(String especie, String raza, String nombre, String fechaNacimiento, String sexo) async {
    var url = Uri.parse('$apiUrl/mascotas');
    var respuesta = await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'},
      body: json.encode(<String, dynamic>{
        'especie': especie,
        'raza': raza,
        'nombre': nombre,
        'sexo': sexo,
      }),
    );
    return json.decode(respuesta.body);
  }

  Future<bool> mascotaBorrar(int id) async {
    var respuesta = await http.delete(Uri.parse('$apiUrl/mascotas/$id'));
    return respuesta.statusCode == 200;
    // if (respuesta.statusCode == 200) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<LinkedHashMap<String, dynamic>> mascota(int id) async {
    var respuesta = await http.get(Uri.parse('$apiUrl/mascotas/$id'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    }
    return LinkedHashMap<String, dynamic>();
  }

  Future<LinkedHashMap<String, dynamic>> mascotaEditar(Mascota mascota) async {
    var url = Uri.parse('$apiUrl/mascotas/${mascota.id}');
    var respuesta = await http.put(
      url,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'},
      body: json.encode(<String, dynamic>{
        'especie': mascota.especie,
        'raza': mascota.raza,
        'nombre': mascota.nombre,
        'sexo': mascota.sexo,
      }),
    );
    return json.decode(respuesta.body);
  }
}
