import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  Function()? onTap;
  CustomButton({required this.buttonText, Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            primary: const Color(0xffFF7A01),
            minimumSize: const Size.fromHeight(40)),
        child: Text(
          buttonText,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 14),
        ),
      ),
    );
  }
}
