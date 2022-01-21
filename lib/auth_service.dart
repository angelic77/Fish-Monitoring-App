import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_web/home_screen.dart';
import 'package:flutter_application_web/login_screen.dart';
import 'package:flutter/material.dart';

class AuthService {
  //Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }

  //Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  //Sign in
  signIn(email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print('Signed in');
    }).catchError((e) {
      print(e);
    });
  }
}

signUp(email, password) {
  FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password)
      .then((user) {
    print('Signed uo');
  }).catchError((e) {
    print(e);
  });
}
