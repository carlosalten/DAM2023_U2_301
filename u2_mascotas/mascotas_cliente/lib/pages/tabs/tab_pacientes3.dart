import 'package:flutter/material.dart';
import 'package:mascotas_cliente/models/mascota.dart';
import 'package:mascotas_cliente/services/http_service.dart';
import 'package:mascotas_cliente/widgets/mascota_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabPacientes3 extends StatefulWidget {
  const TabPacientes3({super.key});

  @override
  State<TabPacientes3> createState() => _TabPacientes3State();
}

class _TabPacientes3State extends State<TabPacientes3> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: HttpService().mascotas(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.data.length == 0) {
                    return Center(child: Text('No hay mascotas :('));
                  } else {
                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      separatorBuilder: (_, __) => Divider(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        //Mascota Tile
                        Mascota mascota = Mascota(snapshot.data[index]);
                        return MascotaTile(mascota: mascota);
                        //Fin Mascota Tile
                      },
                    );
                  }
                }),
          ),
          Container(
            width: double.infinity,
            height: 30,
          ),
        ],
      ),

      //BOTON AGREGAR
      floatingActionButton: FloatingActionButton(
        child: Icon(
          MdiIcons.plus,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      //FIN BOTON AGREGAR
    );
  }
}
