import 'package:flutter/material.dart';
import '../widgets/textField.dart';
import '../widgets/signup/textWidget.dart';

class SignUp extends StatelessWidget {
  static String id = "SignUp";
  final String fontFamily = "Poppins";
  final TextEditingController controller = TextEditingController();
  SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: TextWidget("Sign Up", fontFamily, FontWeight.w600,
                          28, const Color(0xffff7a01)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 1, 0, 16),
                      child: TextWidget(
                          "Enter your credentials to continue",
                          fontFamily,
                          FontWeight.w500,
                          14,
                          const Color(0xff181818)),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 1,
                      child: Container(color: const Color(0xffff7a01)),
                    ),
                    // Credentials widgets
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: TextWidget("Name", fontFamily, FontWeight.w500, 16,
                          const Color(0xff181818)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Textfeild("Enter your name here", controller,
                          TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: TextWidget("Username", fontFamily, FontWeight.w500,
                          16, const Color(0xff181818)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Textfeild("Enter your E-mail Address here",
                          controller, TextInputType.text),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: TextWidget("Phone Number", fontFamily,
                          FontWeight.w500, 16, const Color(0xff181818)),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                      child: Textfeild("Enter your Phone Number here",
                          controller, TextInputType.number),
                    ),
                  ],
                  //credential widgets end
                ),
                const Expanded(
                  child: SizedBox(
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'By continuing you agree to our ',
                style: TextStyle(
                    fontFamily: fontFamily,
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: const Color(0xff030303)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: const Color(0xffFF7A01))),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: const Color(0xff030303)),
                  ),
                  TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          color: const Color(0xffFF7A01))),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xffFF7A01),
                    minimumSize: const Size.fromHeight(40)),
                child: Text(
                  "Continue",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
