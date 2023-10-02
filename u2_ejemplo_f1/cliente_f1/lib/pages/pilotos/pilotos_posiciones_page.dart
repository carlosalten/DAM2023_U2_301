import 'package:flutter/material.dart';
import 'package:u2_clase2/services/http_service.dart';
import 'package:u2_clase2/widgets/piloto_tile.dart';
import 'package:u2_clase2/widgets/titulo_seccion.dart';

class PilotosPosicionesPage extends StatelessWidget {
  final AssetImage fondo = AssetImage('assets/images/fondo_posiciones.jpg');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: fondo, fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          //TITULO SECCION
          TituloSeccion(titulo: 'PILOTOS', subtitulo: 'Posiciones'),
          //FIN TITULO SECCION

          //LISTA PILOTOS
          Expanded(
            child: FutureBuilder(
              future: HttpService().pilotos(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  print('ESPERANDING');
                  return Center(child: CircularProgressIndicator());
                } else {
                  print('DATOS');
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var piloto = snapshot.data[index];
                      return PilotoTile(
                        nombre: piloto['nombre'],
                        numero: piloto['numero'],
                        puntos: piloto['puntos'],
                        pais: piloto['pais'],
                      );
                    },
                  );
                }
              },
            ),
          ),
          //FIN LISTA PILOTOS
        ],
      ),
    );
  }
}
