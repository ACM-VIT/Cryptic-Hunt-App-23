
import 'package:cryptic_hunt/screens/speakerScreen.dart';
import 'package:cryptic_hunt/Providers/LoadingScreen/HomeScreenLoadingPercentage.dart';
import 'package:cryptic_hunt/screens/hamburger.dart';
import 'package:cryptic_hunt/screens/login.dart';
import 'package:cryptic_hunt/screens/onBoarding.dart';
import 'package:cryptic_hunt/screens/Loading.dart';
import 'package:cryptic_hunt/screens/splashScreen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Percentage(),
    child: const myApp(),
  ));
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Routes",
      initialRoute: Hamburger.id,
      //initialRoute: NavigationManager.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        Login.id: (context) => const Login(),
        OnBoarding.id: (context) => const OnBoarding(),
        Loading.id: (context) => const Loading(),
        Hamburger.id: (context) => const Hamburger(),
      },
    );
  }
}
