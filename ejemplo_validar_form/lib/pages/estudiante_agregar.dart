import 'package:flutter/material.dart';

class EstudianteAgregarPage extends StatefulWidget {
  EstudianteAgregarPage({Key? key}) : super(key: key);

  @override
  State<EstudianteAgregarPage> createState() => _EstudianteAgregarPageState();
}

class _EstudianteAgregarPageState extends State<EstudianteAgregarPage> {
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController edadCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade600,
        title: Text('Ejemplo Validar Form', style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
              //NOMBRE
              TextFormField(
                controller: nombreCtrl,
                decoration: InputDecoration(
                  label: Text('Nombre'),
                ),
              ),
              //APELLIDO
              TextFormField(
                controller: apellidoCtrl,
                decoration: InputDecoration(
                  label: Text('Apellido'),
                ),
              ),
              //EDAD
              TextFormField(
                controller: edadCtrl,
                decoration: InputDecoration(
                  label: Text('Edad'),
                ),
              ),
              //BOTON
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text('Agregar Estudiante', style: TextStyle(color: Colors.white)),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
