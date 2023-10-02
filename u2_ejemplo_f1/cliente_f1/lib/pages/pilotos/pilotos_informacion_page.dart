import 'package:flutter/material.dart';
import 'package:u2_clase2/widgets/titulo_seccion.dart';

class PilotosInformacionPage extends StatelessWidget {
  final AssetImage fondo = AssetImage('assets/images/fondo_informacion.jpg');

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: fondo, fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          //TITULO SECCION
          TituloSeccion(titulo: 'PILOTOS', subtitulo: 'Información'),
          //FIN TITULO SECCION
        ],
      ),
    );
  }
}
