import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:u2_clase2/widgets/piloto_tile.dart';

class PilotosPage extends StatefulWidget {
  PilotosPage({Key? key}) : super(key: key);

  @override
  State<PilotosPage> createState() => _PilotosPageState();
}

class _PilotosPageState extends State<PilotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/fondo.jpg'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            //TITULO SECCION
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(30, 10, 0, 5),
              decoration: BoxDecoration(
                color: Color(0xCC16171F),
                border: Border(bottom: BorderSide(color: Color(0xFFE10600), width: 7)),
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
              child: ListView(
                children: [
                  PilotoTile(nombre: 'Max Verstappen', numero: 1, puntos: 400, pais: 'NED'),
                  PilotoTile(nombre: 'Sergio Perez', numero: 11, puntos: 223, pais: 'MEX'),
                  PilotoTile(nombre: 'Lewis Hamilton', numero: 44, puntos: 190, pais: 'GBR'),
                ],
              ),
            ),
            //FIN LISTA PILOTOS
          ],
        ),
      ),
      //BOTTOM NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFFE10600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.listBoxOutline),
            label: 'Posiciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.racingHelmet),
            label: 'Información',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.counter),
            label: 'Estadísticas',
          ),
        ],
      ),
      //FIN BOTTOM NAVBAR
    );
  }
}
