import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yourpadel/presentation_layer/screens/Navigation_screen/Navigation_screen.dart';
import 'package:yourpadel/presentation_layer/screens/on_boarding/on_boarding_screen.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NavigationScreen();
          } else {
            return OnBoardingScreen();
          }
        },
      ),
    );
  }
}
