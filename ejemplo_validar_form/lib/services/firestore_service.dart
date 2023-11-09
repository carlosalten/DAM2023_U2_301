import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener la lista de estudiantes
  Stream<QuerySnapshot> estudiantes() {
    return FirebaseFirestore.instance.collection('estudiantes').snapshots();
    // return FirebaseFirestore.instance.collection('estudiantes').where('edad',isLessThanOrEqualTo: 25).orderBy('apellido').snapshots();
    // return FirebaseFirestore.instance.collection('estudiantes').get()
  }

  //insertar nuevo estudiante
  Future<void> estudianteAgregar(String nombre, String apellido, int edad, DateTime fecha_matricula) async {
    return FirebaseFirestore.instance.collection('estudiantes').doc().set({
      'nombre': nombre,
      'apellido': apellido,
      'edad': edad,
      'fecha_matricula': fecha_matricula,
    });
  }

  //borrar estudiante
  Future<void> estudianteBorrar(String docId) async {
    return FirebaseFirestore.instance.collection('estudiantes').doc(docId).delete();
  }
}
