import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import "app/app.dart";

import 'package:adopta_amigo/app/firebase_options.dart';


void main() async {

 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );

  runApp(const MyApp());
}


