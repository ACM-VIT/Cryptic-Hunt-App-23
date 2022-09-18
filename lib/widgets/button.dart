import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class customButton extends StatelessWidget {
  const customButton({Key? key}) : super(key: key);

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
