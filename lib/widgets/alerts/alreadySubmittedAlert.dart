import 'package:cryptic_hunt/widgets/alerts/custom_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AlreadySubmittedAlert extends StatelessWidget {
  AlreadySubmittedAlert({super.key, required this.onPressed});

  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    // return AlertDialog(
    //   title: const Text('Answer Already Submitted'),
    //   content: SingleChildScrollView(
    //     child: ListBody(
    //       children: const <Widget>[
    //         Text('This is a demo alert dialog.'),
    //         Text('Would you like to approve of this message?'),
    //       ],
    //     ),
    //   ),
    //   actions: <Widget>[
    //     TextButton(
    //       child: const Text('Go Back'),
    //       onPressed: onPressed,
    //     ),
    //   ],
    // );

    return CustomAlertDialog(
        title: "Answer Already Submitted",
        buttonText: "Ok",
        onPressed: onPressed);
  }
}
