import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:shared_preferences/shared_preferences.dart";
import 'home.dart';


class AuthUser extends StatelessWidget {
  const AuthUser({super.key});

  @override
  Widget build(BuildContext context) {
    //se añade firebaseAuth 
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoginScreen();    //Pagina para hacer screen 
        }

        return HomePage();
      },
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: [EmailAuthProvider()],
      headerBuilder: (context, constraints, shrinkOffset) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset('../assets/logo_2.png'),
          ),
        );
      },
      subtitleBuilder: (context, action) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: action == AuthAction.signIn
              ? const Text(
                  'Bienvenido, por favor accede para disfrutar del contenido')
              : const Text(
                  'Bienvenido, por favor accede para disfrutar del contenido'),
        );
      },
      footerBuilder: (context, action) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Text(
            'AL acceder, estas deacuerdo con los terminos y condiciones',
            style: TextStyle(color: Color.fromARGB(255, 15, 21, 206)),
          ),
        );
      },
      actions: [
        ForgotPasswordAction((context, email) {
          Navigator.pushNamed(
            context,
            '/forgot-password',
            arguments: {'email': email},
          );
        }),
        AuthStateChangeAction((context, state) {
          final user = switch (state) {
            SignedIn(user: final user) => user,
            CredentialLinked(user: final user) => user,
            UserCreated(credential: final cred) => cred.user,
            _ => null,
          };

          switch (user) {
            case User(emailVerified: true):
            //obtenemos los datos de la colleccion 
            
            Navigator.push( context, 
            MaterialPageRoute(builder: (context) { return HomePage();}, 
            settings: RouteSettings(arguments: {'user': user}))
            );
            case User(emailVerified: false, email: final String _):
              Navigator.pushNamed(context, '/verify-email');
          }
        }),
        EmailLinkSignInAction((context) {
          Navigator.pushReplacementNamed(context, '/email-link-sign-in');
        }),
      ],
    );
  }
}

 _saveCustomer (user) async{
  
     final prefs = await SharedPreferences.getInstance();

   for (var docSnapshot in user) {
      print('${docSnapshot.nombre} => ${docSnapshot.data()}');
    }

 //   prefs.setString("customer_email", userEmail);

}

_setCustomer() async{

    var userRef = FirebaseFirestore.instance.collection("usuarios"); 

    var user = FirebaseAuth.instance.currentUser;

    var userEmail = "";

    if (user != null){
         userEmail = user.email.toString();
    }

    var loggedUser = userRef.where("email" , isEqualTo: userEmail ).get();

     _saveCustomer(loggedUser);
}