import 'package:cryptic_hunt/screens/profile.dart';
import 'package:cryptic_hunt/screens/create_team.dart';
import 'package:cryptic_hunt/screens/faq_screen.dart';
import 'providers/LoadingScreen/HomeScreenLoadingPercentage.dart';
import 'screens/hamburger.dart';
import 'screens/login.dart';
import 'screens/navigation_manager.dart';
import 'screens/onBoarding.dart';
import 'screens/Loading.dart';
import 'screens/splashScreen.dart';
import 'package:cryptic_hunt/screens/speakerScreen.dart';
import 'package:cryptic_hunt/screens/signUp.dart';
import 'package:cryptic_hunt/widgets/countdowntimer.dart';

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
      color: const Color(0xffC7C7C7),
      title: "Routes",
      initialRoute: ProfilePage.id,
      routes: {
        ProfilePage.id: (context) => ProfilePage(),
        NavigationManager.id: (context) => const NavigationManager(),
        SignUp.id: (context) => SignUp(),
        SplashScreen.id: (context) => const SplashScreen(),
        Login.id: (context) => const Login(),
        OnBoarding.id: (context) => const OnBoarding(),
        Loading.id: (context) => const Loading(),
        // Hamburger.id: (context) => const Hamburger(),
        CountDownTimer.id: (context) => const CountDownTimer(),
        SpeakerScreen.id: (context) => const SpeakerScreen(),
        CreateTeam.id: (context) => const CreateTeamPage(),
        'faq': (context) => const FaqScreen(),
      },
    );
  }
}
