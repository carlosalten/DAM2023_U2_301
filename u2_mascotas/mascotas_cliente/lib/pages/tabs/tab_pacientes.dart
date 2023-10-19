import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class TabPacientes extends StatefulWidget {
  const TabPacientes({super.key});

  @override
  State<TabPacientes> createState() => _TabPacientesState();
}

class _TabPacientesState extends State<TabPacientes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              children: [
                ListTile(
                  leading: Icon(MdiIcons.dog, size: 30, color: Colors.deepPurple),
                  title: Row(
                    children: [
                      Text(
                        'Frank',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        ' (Perro)',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  subtitle: Text('Pug | Macho'),
                  trailing: InkWell(
                    child: Icon(MdiIcons.trashCan, color: Colors.red.shade900),
                    onTap: () {},
                  ),
                ),
                Divider(),
              ],
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
