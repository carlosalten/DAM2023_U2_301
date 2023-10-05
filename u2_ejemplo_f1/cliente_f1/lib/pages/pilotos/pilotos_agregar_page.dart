import 'package:flutter/material.dart';
import 'package:u2_clase2/constants.dart';
import 'package:u2_clase2/services/http_service.dart';
import 'package:u2_clase2/widgets/campo_form.dart';
import 'package:u2_clase2/widgets/logo_f1.dart';
import 'package:u2_clase2/widgets/titulo_seccion.dart';

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

  String errNombre = '', errNumero = '', errPuntos = '', errFechaNacimiento = '', errPais = '';

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
              TituloSeccion(titulo: 'PILOTOS', subtitulo: 'Agregar'),
              //FIN TITULO SECCION

              //FORMULARIO
              Expanded(
                child: ListView(
                  children: [
                    //nombre
                    CampoForm(
                      controller: nombreCtrl,
                      titulo: 'Nombre',
                      textoError: errNombre,
                    ),
                    //numero
                    CampoForm(
                      controller: numeroCtrl,
                      titulo: 'Número',
                      tipoTeclado: TextInputType.number,
                      textoError: errNumero,
                    ),
                    //puntos
                    CampoForm(
                      controller: puntosCtrl,
                      titulo: 'Puntos',
                      tipoTeclado: TextInputType.number,
                      textoError: errPuntos,
                    ),
                    //fecha de nacimiento
                    CampoForm(
                      controller: fechaNacimientoCtrl,
                      titulo: 'Fecha de Nacimiento',
                      tipoTeclado: TextInputType.datetime,
                      textoError: errFechaNacimiento,
                    ),
                    //pais
                    CampoForm(
                      controller: paisCtrl,
                      titulo: 'País',
                      textoError: errPais,
                    ),
                  ],
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
                  onPressed: () async {
                    int numero = int.tryParse(numeroCtrl.text) ?? -1;
                    int puntos = int.tryParse(puntosCtrl.text) ?? -1;

                    var respuesta = await HttpService().pilotosAgregar(
                      nombreCtrl.text,
                      numero,
                      puntos,
                      fechaNacimientoCtrl.text,
                      paisCtrl.text,
                    );

                    if (respuesta['message'] != null) {
                      //quedarme en la página para mostrar errores
                      setState(() {
                        var errores = respuesta['errors'];
                        // if (errores['nombre'] != null) {
                        //   errNombre = errores['nombre'][0];
                        // }
                        errNombre = errores['nombre'] != null ? errores['nombre'][0] : '';
                        errNumero = errores['numero'] != null ? errores['numero'][0] : '';
                        errPuntos = errores['puntos'] != null ? errores['puntos'][0] : '';
                        errFechaNacimiento = errores['fecha_nacimiento'] != null ? errores['fecha_nacimiento'][0] : '';
                        errPais = errores['pais'] != null ? errores['pais'][0] : '';
                      });
                    } else {
                      //inserción ok
                      Navigator.pop(context);
                    }
                  },
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
