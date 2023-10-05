import 'package:flutter/material.dart';

class CampoForm extends StatelessWidget {
  const CampoForm({
    super.key,
    required this.controller,
    required this.titulo,
    this.tipoTeclado = TextInputType.text,
    this.textoError = '',
  });

  final TextEditingController controller;
  final String titulo;
  final TextInputType tipoTeclado;
  final String textoError;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: this.titulo),
            keyboardType: tipoTeclado,
          ),
          Text(
            this.textoError,
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
