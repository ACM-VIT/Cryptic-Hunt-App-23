import 'package:cryptic_hunt/widgets/alerts/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HintAlert extends StatelessWidget {
  const HintAlert({super.key, required this.onPressed, required this.hintText});

  final void Function() onPressed;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    // return AlertDialog(
    //   title: const Text('Hint'),
    //   content: SingleChildScrollView(
    //     child: ListBody(
    //       children: <Widget>[
    //         Text(hintText),
    //       ],
    //     ),
    //   ),
    //   actions: <Widget>[
    //     TextButton(
    //       child: Text('back'),
    //       onPressed: onPressed,
    //     ),
    //   ],
    // );

    return CustomAlertDialog(
        title: "Hint",
        message: hintText,
        buttonText: "Cancel",
        onPressed: onPressed);
  }
}
