import 'package:cryptic_hunt/screens/login.dart';
import 'package:cryptic_hunt/screens/onBoarding.dart';
import 'package:cryptic_hunt/screens/sample.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    isLoggedIn();
    return MaterialApp(
      title: "Routes",
      initialRoute: Login.id,
      routes: {
        Login.id: (context) => const Login(),
        OnBoarding.id: (context) => const OnBoarding(),
        Sample.id: (context) => const Sample(),
      },
    );
  }
}

void isLoggedIn() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  final loggedIn = sharedPreferences.getBool("Logged_In") ?? false;
  Fluttertoast.showToast(msg: "$loggedIn");
}
