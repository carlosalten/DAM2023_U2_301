import 'package:flutter/material.dart';

class UtilMensaje {
  static void mostrarSnackbar(BuildContext context, IconData icono, String texto, {int duracion = 2}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(icono, color: Colors.white),
          Text(' ' + texto),
        ],
      ),
      duration: Duration(seconds: duracion),
    ));
  }
}
