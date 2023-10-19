import 'package:flutter/material.dart';
import 'package:mascotas_cliente/pages/tabs/tab_equipo.dart';
import 'package:mascotas_cliente/pages/tabs/tab_pacientes.dart';
import 'package:mascotas_cliente/pages/tabs/tab_urgencias.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        //APPBAR
        appBar: AppBar(
          forceMaterialTransparency: true,
        ),
        //FIN APPBAR

        //BODY
        body: Column(
          children: [
            //TITULO Y TABS
            Container(
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bg_perro.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(top: 60),
                padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0x66FFFFFF), width: 10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TABS
                    TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      indicatorColor: Colors.white,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      tabs: [
                        Tab(text: 'Pacientes'),
                        Tab(text: 'Equipo'),
                        Tab(text: 'Urgencias'),
                      ],
                    ),

                    //TITULO APP
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Veterinaria Santa María',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //FIN TITULO Y TABS

            //PAGINAS
            Expanded(
              child: Container(
                color: Color(0xFFF2F4F6), //fondo celeste
                padding: EdgeInsets.all(10), //pequeño padding para que se vea el fondo
                child: Container(
                  //cuadro blanco donde se cargan los datos
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Color(0x447689C1)),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: TabBarView(
                    children: [TabPacientes(), TabEquipo(), TabUrgencias()],
                  ),
                ),
              ),
            ),

            //FIN PAGINAS
          ],
        ),
      ),
    );
  }
}
