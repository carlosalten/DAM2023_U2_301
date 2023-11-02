import 'package:flutter/material.dart';
import 'package:mascotas_cliente/models/mascota.dart';
import 'package:mascotas_cliente/pages/pacientes_editar_page.dart';
import 'package:mascotas_cliente/services/http_service.dart';
import 'package:mascotas_cliente/utils/util_mensaje.dart';
import 'package:mascotas_cliente/widgets/mascota_tile.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TabPacientes3 extends StatefulWidget {
  const TabPacientes3({super.key});

  @override
  State<TabPacientes3> createState() => _TabPacientes3State();
}

class _TabPacientes3State extends State<TabPacientes3> {
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
                      return Slidable(
                        child: MascotaTile(mascota: mascota),
                        startActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                              icon: MdiIcons.dog,
                              label: 'Ver Info',
                              onPressed: (context) {},
                            ),
                          ],
                        ),
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          children: [
                            SlidableAction(
                              backgroundColor: Colors.purple,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Editar',
                              onPressed: (context) {
                                //navegar al formulario de edición
                                MaterialPageRoute route = MaterialPageRoute(builder: (context) => PacientesEditarPage(mascotaId: mascota.id));
                                Navigator.push(context, route).then((value) {
                                  setState(() {});
                                });
                              },
                            ),
                            SlidableAction(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              icon: MdiIcons.trashCan,
                              label: 'Borrar',
                              onPressed: (context) {
                                setState(() {
                                  HttpService().mascotaBorrar(mascota.id).then((borradoOk) {
                                    UtilMensaje.mostrarSnackbar(
                                      scaffoldKey.currentContext!,
                                      MdiIcons.alert,
                                      'Se ha borrado a ${mascota.nombre}',
                                    );
                                  });
                                });
                              },
                            ),
                          ],
                        ),
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
