import 'package:flutter/material.dart';
import 'package:mascotas_cliente/models/mascota.dart';
import 'package:mascotas_cliente/services/http_service.dart';
import 'package:mascotas_cliente/utils/util_mensaje.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabPacientes1 extends StatefulWidget {
  const TabPacientes1({super.key});

  @override
  State<TabPacientes1> createState() => _TabPacientes1State();
}

class _TabPacientes1State extends State<TabPacientes1> {
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
                        Mascota mascota = Mascota(snapshot.data[index]);
                        return ListTile(
                          leading: Icon(
                            mascota.especie == 'Perro' ? MdiIcons.dog : MdiIcons.cat,
                            size: 30,
                            color: mascota.especie == 'Perro' ? Colors.deepPurple : Colors.deepOrange,
                          ),
                          title: Row(
                            children: [
                              Text(
                                mascota.nombre,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                ' (${mascota.especie})',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          subtitle: Text('${mascota.raza} | ${mascota.sexo == 'M' ? 'Macho' : 'Hembra'}'),
                          trailing: InkWell(
                            child: Icon(MdiIcons.trashCan, color: Colors.red.shade900),
                            onTap: () {
                              confirmDialog(mascota).then((confirmaBorrado) {
                                if (confirmaBorrado) {
                                  setState(() {
                                    HttpService().mascotasBorrar(mascota.id).then((borradoOk) {
                                      if (borradoOk) {
                                        //pudo borrar :)
                                        UtilMensaje.mostrarSnackbar(scaffoldKey.currentContext!, MdiIcons.alertCircle, 'Se borró a ${mascota.nombre}');
                                      } else {
                                        //no pudo borrar :(
                                      }
                                    });
                                  });
                                }
                              });
                            },
                          ),
                        );
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

  Future<dynamic> confirmDialog(Mascota mascota) {
    return showDialog(
        barrierDismissible: false,
        context: scaffoldKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: Text('Confirmar borrado'),
            content: Text('¿Borrar a ${mascota.nombre}?'),
            actions: [
              TextButton(
                child: Text('CANCELAR'),
                onPressed: () => Navigator.pop(context, false),
              ),
              ElevatedButton(
                child: Text('ACEPTAR'),
                onPressed: () => Navigator.pop(context, true),
              ),
            ],
          );
        });
  }
}
