import 'package:cryptic_hunt/screens/sample.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  static String id = "SplashScreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkUserLoggedIn();
  }

  _checkUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    loggedIn = sharedPreferences.getBool("Logged_In") ?? false;
    if (loggedIn) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Sample.id, (route) => false);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(Login.id, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Splash")),
    );
  }
}
