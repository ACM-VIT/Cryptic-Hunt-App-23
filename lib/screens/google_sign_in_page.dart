import 'package:cryptic_hunt/Providers/login_page_notifier.dart';
import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/screens/navigation_manager.dart';
import 'package:cryptic_hunt/screens/team_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'onBoarding.dart';

// class GoogleSignInPage extends StatelessWidget {
//   static String id = "Login";
//   const GoogleSignInPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: LoginPage(),
//     );
//   }
// }

class GoogleSignInPage extends StatelessWidget {
  static String id = 'GoogleSignInPage';
  const GoogleSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        width: double.infinity,
        //margin: const EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          clipBehavior: Clip.none,
          children: [
            const SizedBox(
              height: 80,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset('assets/login/google_sign_in_owl.svg'),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: RichText(
                  text: TextSpan(
                children: [
                  TextSpan(
                    text: "We are the ",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          color: const Color(0xFF777777),
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  TextSpan(
                      text: "Event",
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                            fontWeight: FontWeight.w900,
                          )),
                  TextSpan(
                    text: "\neveryone’s been waiting for",
                    style: Theme.of(context).textTheme.headline1?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF777777),
                        ),
                  ),
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
                      ? Center(
                          child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor),
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
                                primary: Theme.of(context).primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: SvgPicture.asset(
                                      'assets/login/google_logo.svg',
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Sign In with Google",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      ?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14,
                                      ),
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
