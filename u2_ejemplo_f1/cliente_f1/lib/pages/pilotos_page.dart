import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:u2_clase2/constants.dart';
import 'package:u2_clase2/pages/pilotos/pilotos_agregar_page.dart';
import 'package:u2_clase2/pages/pilotos/pilotos_estadisticas_page.dart';
import 'package:u2_clase2/pages/pilotos/pilotos_informacion_page.dart';
import 'package:u2_clase2/pages/pilotos/pilotos_posiciones_page.dart';

class PilotosPage extends StatefulWidget {
  PilotosPage({Key? key}) : super(key: key);

  @override
  State<PilotosPage> createState() => _PilotosPageState();
}

class _PilotosPageState extends State<PilotosPage> {
  int indicePagina = 0;
  List paginas = [PilotosPosicionesPage(), PilotosInformacionPage(), PilotosEstadisticasPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: paginas[indicePagina],
      //BOTTOM NAVBAR
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indicePagina,
        onTap: (index) {
          setState(() {
            indicePagina = index;
          });
        },
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

      //BOTON AGREGAR
      floatingActionButton: FloatingActionButton(
        child: Icon(
          MdiIcons.accountPlus,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Color(kPrimaryColor),
        onPressed: () {
          MaterialPageRoute ruta = MaterialPageRoute(builder: (context) => PilotosAgregarPage());
          Navigator.push(context, ruta);
        },
      ),
      //FIN BOTON AGREGAR
    );
  }
}
