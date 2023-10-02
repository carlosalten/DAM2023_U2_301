import 'package:flutter/material.dart';

class CampoForm extends StatelessWidget {
  const CampoForm({
    super.key,
    required this.controller,
    required this.titulo,
    required this.tipoTeclado,
  });

  final TextEditingController controller;
  final String titulo;
  final TextInputType tipoTeclado;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: this.titulo),
        keyboardType: tipoTeclado,
      ),
    );
  }
}
