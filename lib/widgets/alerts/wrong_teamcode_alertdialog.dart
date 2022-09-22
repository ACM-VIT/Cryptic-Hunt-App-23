import 'package:cryptic_hunt/widgets/signup/textWidget.dart';
import 'package:flutter/material.dart';

class WrongTeamCodeAlertDialog extends StatelessWidget {
  final fontFamily = "Poppins";
  const WrongTeamCodeAlertDialog({Key? key}) : super(key: key);

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
          Text(
            "Error!",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: fontFamily,
              fontSize: 22,
              color: const Color(0xFFFF7A01),
            ),
          ),
        ],
      ),
      content: CustomTextWidget(
        "You have entered invalid code!",
        fontFamily,
        FontWeight.w500,
        14,
        const Color(0xFF181818),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xffFF7A01),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Retry!",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}
