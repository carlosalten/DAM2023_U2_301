import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:u2_clase2/constants.dart';
import 'package:u2_clase2/widgets/logo_f1.dart';

class PilotosAgregarPage extends StatefulWidget {
  const PilotosAgregarPage({super.key});

  @override
  State<PilotosAgregarPage> createState() => _PilotosAgregarPageState();
}

class _PilotosAgregarPageState extends State<PilotosAgregarPage> {
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController numeroCtrl = TextEditingController();
  TextEditingController puntosCtrl = TextEditingController();
  TextEditingController fechaNacimientoCtrl = TextEditingController();
  TextEditingController paisCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LogoF1(),
      ),
      body: Form(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/fondo_pilotos_agregar.jpg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              //TITULO SECCION
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(30, 10, 0, 5),
                decoration: BoxDecoration(
                  color: Color(kSecondaryColor),
                  border: Border(bottom: BorderSide(color: Color(kPrimaryColor), width: 7)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Agregar',
                      style: GoogleFonts.oxanium(textStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.white)),
                    ),
                    Text(
                      'PILOTOS',
                      style: GoogleFonts.oxanium(
                        textStyle: TextStyle(height: 0.8, color: Colors.white, fontSize: 22, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              //FIN TITULO SECCION

              //FORMULARIO
              Expanded(
                child: ListView(
                  children: [],
                ),
              ),
              //FORMULARIO

              //BOTON ACEPTAR
              Container(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: Text('AGREGAR'),
                  onPressed: () {},
                ),
              ),
              //FIN BOTON ACEPTAR

              //BOTON CANCELAR
              Container(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(kSecondaryColor)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Text(
                    'CANCELAR',
                    style: TextStyle(color: Color(kSecondaryColor)),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              //FIN BOTON CANCELAR
            ],
          ),
        ),
      ),
    );
  }
}
