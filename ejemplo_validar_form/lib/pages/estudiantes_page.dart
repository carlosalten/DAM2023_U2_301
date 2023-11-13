import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejemplo_validar_form/pages/estudiante_agregar.dart';
import 'package:ejemplo_validar_form/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EstudiantesPage extends StatelessWidget {
  // const EstudiantesPage({Key? key}) : super(key: key);

  final formatoFecha = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estudiantes Firebase'),
        leading: Icon(
          MdiIcons.firebase,
          color: Colors.yellow.shade700,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirestoreService().estudiantes(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var estudiante = snapshot.data!.docs[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: MdiIcons.trashCan,
                          label: 'Borrar',
                          onPressed: (context) {
                            FirestoreService().estudianteBorrar(estudiante.id);
                          },
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(MdiIcons.account),
                      title: Text('${estudiante['nombre']} ${estudiante['apellido']}'),
                      subtitle: Text(estudiante['carrera']),
                      // subtitle: Text('Fecha de Matrícula: ' + formatoFecha.format(estudiante['fecha_matricula'].toDate())),
                      onLongPress: () {
                        mostrarInfoEstudiante(context, estudiante);
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          MaterialPageRoute route = MaterialPageRoute(builder: (context) => EstudianteAgregarPage());
          Navigator.push(context, route);
        },
      ),
    );
  }

  void mostrarInfoEstudiante(BuildContext context, estudiante) {
    // print(estudiante['nombre']);
    showBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 350,
          child: Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nombre: ${estudiante['nombre']} ${estudiante['apellido']}'),
                Text('Carrera: ${estudiante['carrera']}'),
                Text('Edad:${estudiante['edad']}'),
                Spacer(),
                Container(
                  width: double.infinity,
                  child: OutlinedButton(
                    child: Text('Cerrar'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
