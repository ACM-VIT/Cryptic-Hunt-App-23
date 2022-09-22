import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  const CustomButton({required this.buttonText, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: const Color(0xffFF7A01),
              minimumSize: const Size.fromHeight(40)),
          child: const Text(
            "Continue",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 14),
          )),
    );
  }
}
