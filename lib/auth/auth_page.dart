import 'package:expense_tracker/on_boarding/on_boarding2.dart';
import 'package:expense_tracker/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  static const String authRoute = 'AuthPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomeView();
          }
          return OnBoarding2();
        },
      ),
    );
  }
}
