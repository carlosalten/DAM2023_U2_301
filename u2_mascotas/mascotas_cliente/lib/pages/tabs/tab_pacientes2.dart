import 'package:flutter/material.dart';
import 'package:mascotas_cliente/models/mascota.dart';
import 'package:mascotas_cliente/services/http_service.dart';
import 'package:mascotas_cliente/utils/util_mensaje.dart';
import 'package:mascotas_cliente/widgets/mascota_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabPacientes2 extends StatefulWidget {
  const TabPacientes2({super.key});

  @override
  State<TabPacientes2> createState() => _TabPacientes2State();
}

class _TabPacientes2State extends State<TabPacientes2> {
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
                        return Dismissible(
                          key: ObjectKey(mascota.id),
                          // direction: DismissDirection.endToStart,
                          secondaryBackground: Container(
                            padding: EdgeInsets.only(right: 5),
                            alignment: Alignment.centerRight,
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Borrar', style: TextStyle(color: Colors.white)),
                                Icon(MdiIcons.trashCan, color: Colors.white),
                              ],
                            ),
                          ),
                          background: Container(
                            color: Colors.purple,
                          ),
                          child: MascotaTile(mascota: mascota),
                          onDismissed: (direction) {
                            setState(() {
                              HttpService().mascotasBorrar(mascota.id).then((borradoOk) {
                                if (borradoOk) {
                                  //mostrar mensaje
                                  UtilMensaje.mostrarSnackbar(
                                    scaffoldKey.currentContext!,
                                    MdiIcons.alert,
                                    'Se borró a ${mascota.nombre}',
                                  );
                                }
                              });
                            });

                            // if (direction == DismissDirection.startToEnd) {
                            //   //desplazó hacia la derecha
                            // } else if (direction == DismissDirection.endToStart) {
                            //   //desplazó a la izquierda
                            // } else {
                            //   //otro
                            // }
                          },
                        );
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
