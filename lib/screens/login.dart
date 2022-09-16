import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onBoarding.dart';

class Login extends StatelessWidget {
  static String id = "Login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crytic Hunt"),
        backgroundColor: const Color(0xffff7a01),
      ),
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
            onPressed: () {
              writeInSharedPreference();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OnBoarding()),
              );
            },
            child: const Text("Login")),
      ),
    );
  }

  void writeInSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("Logged_In", true);
  }
}