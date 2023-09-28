import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiUrl = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> pilotos() async {
    var respuesta = await http.get(Uri.parse(apiUrl + '/pilotos'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    }
    return [];
  }
}
