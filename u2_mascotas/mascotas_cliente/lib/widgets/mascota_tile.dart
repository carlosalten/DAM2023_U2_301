import 'package:flutter/material.dart';
import 'package:mascotas_cliente/models/mascota.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MascotaTile extends StatelessWidget {
  const MascotaTile({
    super.key,
    required this.mascota,
  });

  final Mascota mascota;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        mascota.especie == 'Gato' ? MdiIcons.cat : MdiIcons.dog,
        size: 30,
        color: mascota.especie == 'Gato' ? Colors.deepOrange : Colors.deepPurple,
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
    );
  }
}
