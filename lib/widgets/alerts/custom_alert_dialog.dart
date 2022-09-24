import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final fontFamily = "Poppins";
  final String title, buttonText;
  String? message;
  String? imgLink;
  void Function() onPressed;
  CustomAlertDialog(
      {this.imgLink,
      required this.title,
      this.message,
      required this.buttonText,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 4.0),
          borderRadius: BorderRadius.all(Radius.circular(26.0))),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: fontFamily,
                fontSize: 22,
                color: const Color(0xFFFF7A01),
              ),
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (message != null)
            CustomTextWidget(
              message!,
              fontFamily,
              FontWeight.w500,
              14,
              const Color(0xFF181818),
            ),
          imgLink != null
              ? Image.network(
                  imgLink.toString(),
                  fit: BoxFit.fill,
                  height: 250,
                  width: 250,
                )
              : const SizedBox(
                  height: 0,
                ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffFF7A01),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
