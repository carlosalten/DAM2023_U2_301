import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u2_clase2/constants.dart';
import 'package:u2_clase2/services/http_service.dart';
import 'package:u2_clase2/widgets/piloto_tile.dart';

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
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(30, 10, 0, 5),
            decoration: BoxDecoration(
              color: Color(kSecondaryColor),
              border: Border(bottom: BorderSide(color: Color(kPrimaryColor), width: 7)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Posiciones',
                  style: GoogleFonts.oxanium(textStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
                ),
                Text(
                  'PILOTOS',
                  style: GoogleFonts.oxanium(
                    textStyle: TextStyle(height: 0.8, color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
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
