import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u2_clase2/constants.dart';

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
                  'Información',
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
        ],
      ),
    );
  }
}
