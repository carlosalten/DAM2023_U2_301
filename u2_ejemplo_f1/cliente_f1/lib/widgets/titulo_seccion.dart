import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u2_clase2/constants.dart';

class TituloSeccion extends StatelessWidget {
  const TituloSeccion({
    super.key,
    required this.titulo,
    required this.subtitulo,
  });

  final String titulo;
  final String subtitulo;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            this.subtitulo,
            style: GoogleFonts.oxanium(textStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
          ),
          Text(
            this.titulo,
            style: GoogleFonts.oxanium(
              textStyle: TextStyle(height: 0.8, color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
