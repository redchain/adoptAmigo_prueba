import 'package:flutter/material.dart';
import "login.dart";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(    
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 65, 34, 122)),
          scaffoldBackgroundColor : Colors.green
        ),
        home: const AuthUser()      
     );    
  }
}