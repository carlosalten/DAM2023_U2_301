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
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
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
                      //Tile Mascota
                      Mascota mascota = Mascota.fromSnapshot(snapshot.data[index]);
                      return Dismissible(
                        key: ObjectKey(mascota.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Borrar',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                MdiIcons.trashCan,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        onDismissed: (direction) {
                          //borrar
                          setState(() {
                            HttpService().mascotaBorrar(mascota.id).then((borradoOk) {
                              if (borradoOk) {
                                UtilMensaje.mostrarSnackbar(
                                  scaffoldKey.currentContext!,
                                  MdiIcons.alert,
                                  'Se ha borrado a ${mascota.nombre}',
                                );
                              }
                            });
                          });

                          // if(direction==DismissDirection.startToEnd){
                          //   //hacia la derecha
                          // }else if(direction==DismissDirection.endToStart){
                          //   //hacia la izquierda
                          // }else{
                          //   //otra
                          // }
                        },
                        child: MascotaTile(mascota: mascota),
                      );
                      //Fin Tile Mascota
                    },
                  );
                }
              },
            ),
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
