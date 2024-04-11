import 'package:flutter/material.dart';
import 'package:adopta_amigo/app/model/pet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*Future<List<Pet>> getPetList() async {
  final user = FirebaseAuth.instance.currentUser;  
  final db =  FirebaseFirestore.instance; 
  if (user != null) {
   // final petList = FirebaseFirestore.instance.collection('animales');

    db.collection("animales").get().then(
  (querySnapshot) {
    print("Successfully completed");
    for (var docSnapshot in querySnapshot.docs) {
      print('${docSnapshot.id} => ${docSnapshot.data()}');
    }
  },
  onError: (e) => print("Error completing: $e"),
);

  //  final res = await ref.where('email', isEqualTo: user.email).get();

    // final data = Pet.fromMap(res.docs[0].data());

    print("");
   
  }

  //throw Exception('Error pet list');
}*/

Future getPetList() async {
  final db = FirebaseFirestore.instance;

  List<Pet>? animales;

  QuerySnapshot querySnapshot = await db.collection("animales").get();

  for (var docSnapshot in querySnapshot.docs) {
    final data = docSnapshot.data() as Map<String, dynamic>;

    // Access specific fields in the document
    // var nombre = data['nombre'];
    // var descripcion = data['descripcion'];
    // var especie = data['especie'];
    // var urlImage = data['urlImage'];
    // var idProtectora = data['idProtectora'];

    animales!.add(Pet.fromMap(data));
  }

  return animales;
}

// Pet getPet(String nombre, String especie, String descripcion, String urlImage,
//     String idProtectora) {
//   final data = Pet(
//       nombre: nombre,
//       especie: especie,
//       descripcion: descripcion,
//       urlImage: urlImage,
//       idProtectora: idProtectora);

//   return data;
// }

/*
final List<Article> _articles = [
  Article(
    title: "Instagram quietly limits ‘daily time limit’ option",
    author: "MacRumors",
    imageUrl: "https://picsum.photos/id/1000/960/540",
    postedOn: "Yesterday",
  ),
  Article(
      title: "Google Search dark theme goes fully black for some on the web",
      imageUrl: "https://picsum.photos/id/1010/960/540",
      author: "9to5Google",
      postedOn: "4 hours ago"),
  Article(
    title: "Check your iPhone now: warning signs someone is spying on you",
    author: "New York Times",
    imageUrl: "https://picsum.photos/id/1001/960/540",
    postedOn: "2 days ago",
  ),
  Article(
    title:
        "Amazon’s incredibly popular Lost Ark MMO is ‘at capacity’ in central Europe",
    author: "MacRumors",
    imageUrl: "https://picsum.photos/id/1002/960/540",
    postedOn: "22 hours ago",
  ),
  Article(
    title:
        "Panasonic's 25-megapixel GH6 is the highest resolution Micro Four Thirds camera yet",
    author: "Polygon",
    imageUrl: "https://picsum.photos/id/1020/960/540",
    postedOn: "2 hours ago",
  ),
  Article(
    title: "Samsung Galaxy S22 Ultra charges strangely slowly",
    author: "TechRadar",
    imageUrl: "https://picsum.photos/id/1021/960/540",
    postedOn: "10 days ago",
  ),
  Article(
    title: "Snapchat unveils real-time location sharing",
    author: "Fox Business",
    imageUrl: "https://picsum.photos/id/1060/960/540",
    postedOn: "10 hours ago",
  ),
];
*/
