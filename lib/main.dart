import 'package:cryptic_hunt/Providers/home_page_notifier.dart';
import 'package:cryptic_hunt/Providers/multiple_question_screen_notifier.dart';
import 'package:cryptic_hunt/Providers/question_group_list_notifier.dart';
import 'package:cryptic_hunt/Providers/standalone_question_screen_notifier.dart';
import 'package:cryptic_hunt/locator.dart';

import 'package:cryptic_hunt/data/question.dart';
import 'package:cryptic_hunt/screens/home_page.dart';
import 'package:cryptic_hunt/screens/multiple_question_screen.dart';
import 'package:cryptic_hunt/screens/question_screen.dart';
import 'package:cryptic_hunt/screens/standalone_question_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Providers/sequence_question_screen_notifier.dart';
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
import '/screens/question_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
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
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Color(0XFFFF8618)),
          trackColor: MaterialStateProperty.all(Colors.black),
        ),
        scaffoldBackgroundColor: Color(0xFFFFF4EA),
        primaryColor: Color(0XFFFF8618),
        textTheme: TextTheme(
            headline1: GoogleFonts.poppins().copyWith(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
            subtitle1: GoogleFonts.poppins().copyWith(
                color: Color(0XFF777777),
                fontSize: 14,
                fontWeight: FontWeight.w400)),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffff7a01), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
        ),
      ),
      title: "Routes",
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => ChangeNotifierProvider(
              create: (context) => HomePageNotifier(),
              child: Consumer<HomePageNotifier>(
                  builder: (context, value, child) =>
                      HomePage(notifier: value)),
            ),
        LoadingScreen.id: (context) => const LoadingScreen(),
        NavigationManager.id: (context) => const NavigationManager(),
        SignUp.id: (context) => SignUp(),
        // SplashScreen.id: (context) => const SplashScreen(),
        Login.id: (context) => const Login(),
        OnBoarding.id: (context) => const OnBoarding(),
        // Hamburger.id: (context) => const Hamburger(),
        CountDownTimer.id: (context) => const CountDownTimer(),
        SpeakerScreen.id: (context) => const SpeakerScreen(),

        MultipleQuestionScreen.id: (context) =>
            MultipleQuestionScreen(notifier: MultipleQuestionScreenNotifier()),
      },
    );
  }
}
