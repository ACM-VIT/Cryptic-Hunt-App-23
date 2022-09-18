import 'package:cryptic_hunt/screens/login.dart';
import 'package:cryptic_hunt/services/qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onBoarding.dart';

class Hamburger extends StatelessWidget {
  static String id = "Hamburger";
  const Hamburger({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HamburgerPage(),
    );
  }
}

class HamburgerPage extends StatelessWidget {
  const HamburgerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crytic Hunt"),
        backgroundColor: const Color(0xffff7a01),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: const Color(0xffff7a01),
              ),
              child: Text('Options'),
            ),
            ListTile(
              title: const Text('Boarding Screen'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OnBoarding()),
                );
              },
            ),
            ListTile(
              title: const Text('QR Scanner'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QrScanner()),
                );
              },
            ),
            ListTile(
              title: const Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: const Text("Hamburger"),
      ),
    );
  }

  void writeInSharedPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("Logged_In", true);
  }
}
