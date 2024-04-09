import 'package:adopta_amigo/app/model/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

Future register(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return true;
  } catch (e) {
    return false;
  }
}

Future saveDataUser(Customer data) async {
  final ref = FirebaseFirestore.instance.collection('usuarios');
  final id = Uuid().v4();
  ref.doc(id).set(data.toMap());
}
