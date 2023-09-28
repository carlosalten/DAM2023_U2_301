import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PilotoTile extends StatelessWidget {
  // const PilotoTile({
  //   super.key,
  // });

  final String nombre;
  final int numero;
  final int puntos;
  final String pais;

  PilotoTile({this.nombre = 'Sin nombre', this.numero = 0, this.puntos = 0, this.pais = 'XX'});

  @override
  Widget build(BuildContext context) {
    String nombrePila = this.nombre.substring(0, this.nombre.indexOf(' '));
    String apellido = this.nombre.substring(this.nombre.indexOf(' ') + 1);
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 1),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0xCCFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //numero
          Container(
            width: 35,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFE10600)),
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: Color(0xBB16171F),
            ),
            child: Text(
              this.numero.toString(),
              style: GoogleFonts.oxanium(height: 0.8, textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          //nombre
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '$nombrePila ',
                    style: GoogleFonts.oxanium(textStyle: TextStyle(fontSize: 16)),
                  ),
                  Text(
                    apellido,
                    style: GoogleFonts.oxanium(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Text(
                this.pais,
                style: GoogleFonts.oxanium(textStyle: TextStyle(fontSize: 11, height: 0.8)),
              ),
            ],
          ),
          Spacer(),
          //puntos
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Puntos:',
                style: GoogleFonts.oxanium(textStyle: TextStyle(fontSize: 11, height: 1.3)),
              ),
              Text(
                this.puntos.toString(),
                style: GoogleFonts.oxanium(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, height: 0.7)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
