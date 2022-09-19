import 'package:cryptic_hunt/screens/home_page.dart';

import 'providers/LoadingScreen/HomeScreenLoadingPercentage.dart';
import 'screens/hamburger.dart';
import 'screens/login.dart';
import 'screens/navigation_manager.dart';
import 'screens/onBoarding.dart';
import 'package:cryptic_hunt/screens/speakerScreen.dart';
import 'package:cryptic_hunt/screens/signUp.dart';
import 'package:cryptic_hunt/widgets/countdowntimer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cryptic_hunt/screens/loading_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      color: const Color(0xffC7C7C7),
      title: "Routes",
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => const HomePage(),
        LoadingScreen.id: (context) => const LoadingScreen(),
        NavigationManager.id: (context) => const NavigationManager(),
        SignUp.id: (context) => SignUp(),
        // SplashScreen.id: (context) => const SplashScreen(),
        Login.id: (context) => const Login(),
        OnBoarding.id: (context) => const OnBoarding(),
        // Hamburger.id: (context) => const Hamburger(),
        CountDownTimer.id: (context) => const CountDownTimer(),
        SpeakerScreen.id: (context) => const SpeakerScreen(),
      },
    );
  }
}
