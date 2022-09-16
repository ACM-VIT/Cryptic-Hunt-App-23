import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onBoarding.dart';

class Login extends StatelessWidget {
  static String id = "Login";
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptic Hunt',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cryptic Hunt")),
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
