import 'package:cryptic_hunt/Providers/login_page_notifier.dart';
import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/screens/navigation_manager.dart';
import 'package:cryptic_hunt/screens/team_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
      backgroundColor: const Color(0xffff7a01),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        width: double.infinity,
        color: const Color(0xffff7a01),
        //margin: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          clipBehavior: Clip.none,
          children: [
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/login/treasure.png",
                scale: 1.25,
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                      text: "We are the ",
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline1,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFFFFFFFF))),
                  TextSpan(
                      text: "Event",
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline1,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFF181818))),
                  TextSpan(
                      text: "\neveryone’s been waiting for",
                      style: GoogleFonts.poppins(
                          textStyle: Theme.of(context).textTheme.headline1,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFFFFFFFF))),
                ],
              )),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text:
                        "Get notifications, know about the speaker sessions, about the tracks and know a lot more.",
                    style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.headline1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        color: const Color(0xFFFFF4EA))),
              ])),
            ),
            const SizedBox(height: 35),
            ChangeNotifierProvider(
              create: (_) => LoginPageNotifier(),
              child: Consumer<LoginPageNotifier>(
                builder: (context, provider, child) {
                  return provider.busy
                      ? const Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                      : Container(
                          margin: const EdgeInsets.only(left: 18, right: 18),
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              provider.login();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xFFFFFFFF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                      'assets/login/google_icon.png'),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Sign In with Google",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          const Color.fromRGBO(13, 13, 13, 1)),
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }

  // void writeInSharedPreference() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   sharedPreferences.setBool("Logged_In", true);
  // }
}
