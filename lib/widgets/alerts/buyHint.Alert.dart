import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BuyHintAlert extends StatelessWidget {
  const BuyHintAlert({super.key, required this.onPressed, required this.cost});

  final void Function() onPressed;
  final int cost;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are You Sure?'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(
                '$cost points will be deducted on taking the hint, are you sure you wanna take the hint!!!'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Take Hint'),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
