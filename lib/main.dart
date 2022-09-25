import 'package:cryptic_hunt/Providers/home_page_notifier.dart';
import 'package:cryptic_hunt/Providers/team_notifier.dart';

import 'package:cryptic_hunt/locator.dart';

import 'package:cryptic_hunt/screens/home_page.dart';
import 'package:cryptic_hunt/screens/team_menu_page.dart';
import 'package:cryptic_hunt/screens/team_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:cryptic_hunt/screens/join_team.dart';

import 'package:cryptic_hunt/screens/create_team.dart';
import 'package:cryptic_hunt/screens/faq_screen.dart';
import 'providers/LoadingScreen/HomeScreenLoadingPercentage.dart';

import 'screens/google_sign_in_page.dart';
import 'screens/navigation_manager.dart';
import 'screens/onBoarding.dart';
import 'screens/Loading.dart';
import 'package:cryptic_hunt/screens/speakerScreen.dart';
import 'package:cryptic_hunt/screens/signUp.dart';
import 'package:cryptic_hunt/widgets/countdown_timer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cryptic_hunt/screens/timeline.dart';
import 'package:cryptic_hunt/screens/createTeam.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cryptic_hunt/screens/loading_screen.dart';

Future main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  setup();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFFFF4EA),
      statusBarColor: Color(0xFFFFF4EA),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.dark));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<Percentage>(create: (_) => Percentage()),
      ],
      child: const myApp(),
    ),
  );
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
          radius: Radius.circular(100),
          thickness: MaterialStateProperty.all(7),
          thumbVisibility: MaterialStateProperty.all(true),
          trackVisibility: MaterialStateProperty.all(true),
          thumbColor: MaterialStateProperty.all(Color(0XFFFF8618)),
          trackColor: MaterialStateProperty.all(Colors.black),
        ),
        scaffoldBackgroundColor: Color(0xFFFFF4EA),
        primaryColor: Color(0XFFFF8618),
        textTheme: TextTheme(
            headline1: GoogleFonts.poppins().copyWith(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
            headline2: GoogleFonts.notoSans().copyWith(
                color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
            subtitle1: GoogleFonts.poppins().copyWith(
                color: Color(0XFF777777),
                fontSize: 14,
                fontWeight: FontWeight.w400),
            subtitle2: GoogleFonts.notoSans().copyWith(
                color: Color(0XFF777777),
                fontSize: 16,
                fontWeight: FontWeight.w500)),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffff7a01), width: 2),
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(7))),
        ),
      ),
      title: "Routes",
      initialRoute: HomePage.id,
      routes: {
        TeamMenuPage.id: (context) => const Scaffold(body: TeamMenuPage()),
        JoinTeamScreen.id: (context) => JoinTeamScreen(),

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
        GoogleSignInPage.id: (context) => const GoogleSignInPage(),
        OnBoarding.id: (context) => OnBoarding(),
        Loading.id: (context) => const Loading(),

        NavigationManager.id: (context) => const NavigationManager(),
        // QuestionPage.id: (context) => QuestionPage(),

        // Hamburger.id: (context) => const Hamburger(),
        CountDownTimer.id: (context) => const CountDownTimer(),
        SpeakerScreen.id: (context) => const SpeakerScreen(),
        CreateTeamFirst.id: (context) => CreateTeamFirst(),
        FaqScreen.id: (context) => FaqScreen(),
      },
    );
  }
}
