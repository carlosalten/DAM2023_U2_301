import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiUrl = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> pilotos() async {
    var respuesta = await http.get(Uri.parse(apiUrl + '/pilotos'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    }
    print(respuesta.statusCode);
    return [];
  }

  void pilotosAgregar(String nombre, int numero, int puntos, String fechaNacimiento, String pais) async {
    var url = Uri.parse('$apiUrl/pilotos');
    await http.post(
      url,
      headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8', 'Accept': 'application/json'},
      body: json.encode(<String, dynamic>{
        'nombre': nombre,
        'numero': numero,
        'puntos': puntos,
        'fecha_nacimiento': fechaNacimiento,
        'pais': pais,
      }),
    );
  }
}
