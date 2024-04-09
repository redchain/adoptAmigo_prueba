import 'package:adopta_amigo/app/model/customer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
