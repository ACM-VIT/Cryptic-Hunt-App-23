import 'package:cryptic_hunt/screens/loading_screen.dart';
import 'package:cryptic_hunt/screens/navigation_manager.dart';
import 'package:cryptic_hunt/screens/onBoarding.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  static String id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasData) {
          return const NavigationManager();
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong!'));
        } else {
          return const OnBoarding();
        }
      },
    );
  }
}
