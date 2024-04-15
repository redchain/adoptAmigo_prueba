import 'package:adopta_amigo/app/model/customer.dart';
import 'package:adopta_amigo/app/model/pet.dart';
import 'package:adopta_amigo/app/model/collaborator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<Customer> getInfoUser() async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    final ref = FirebaseFirestore.instance.collection('usuarios');

    final res = await ref.where('email', isEqualTo: user.email).get();
    final data = Customer.fromMap(res.docs[0].data());
    return data;
  }
  throw Exception('No se encontro el usuario');
}

Future<Pet> getInfoPet([String? uid]) async {
  final user = FirebaseAuth.instance.currentUser;
  dynamic data;
  if (user != null) {
    try {
      final ref = FirebaseFirestore.instance.collection('animales');
      await ref.doc(uid).get().then(
        (DocumentSnapshot doc) {
          data = doc.data() as Map<String, dynamic>;
        },
        onError: (e) => print("Error getting document: $e"),
      );

      return Pet.fromMap(data);
    } catch (e) {
      throw Exception('No se encontro la mascota');
    }
  }

  throw Exception('No se encontro la mascota');
}

Future<Collaborator> getInfoCollaborator([String? uid]) async {
  final user = FirebaseAuth.instance.currentUser;
  dynamic data;
  if (user != null) {
    final ref = FirebaseFirestore.instance.collection('protectoras');

    await ref.doc(uid).get().then(
      (DocumentSnapshot doc) {
        data = doc.data() as Map<String, dynamic>;
      },
      onError: (e) => print("Error getting document: $e"),
    );

    return Collaborator.fromMap(data);
  }
  throw Exception('No se encontro el usuario');
}

Future<bool> setAdoption(String idAnimal) async {
  var ret = false;

  final user = FirebaseAuth.instance.currentUser;

  final ref = FirebaseFirestore.instance.collection('adopciones');


  final data = {"id_animal": idAnimal, "id_usuario": user!.uid};

  final res = await ref.add(data).then((documentSnapshot) => {

        if (documentSnapshot.id != "") {
          updateAnimal(idAnimal),
          ret = true
         } else
         {
          ret = false
          }
      });

  return ret;

  //dos partes se guardan aqui, se guarda en la bd de adopciones
  //y luego se actualiza el valor en animal
}

bool updateAnimal(String idAnimal){


    var ret = false;

     final animales = FirebaseFirestore.instance.collection('animales');
     final animalDoc = animales.doc(idAnimal).update({"isAdopted" : true}).then(
    (value) => {ret = true},
     onError: (e) => print("Error updating document $e"));

     return true;
}


