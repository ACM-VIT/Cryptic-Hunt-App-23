import 'package:flutter/material.dart';

class TimeDisplay extends StatefulWidget {
  int timeContent;
  TimeDisplay(this.timeContent, {super.key});

  @override
  State<TimeDisplay> createState() => _TimeDisplayState();
}

class _TimeDisplayState extends State<TimeDisplay> {
  @override
  Widget build(BuildContext context) {
    String contentDisplayed = widget.timeContent.toString();
    if (contentDisplayed.length < 2) {
      contentDisplayed = "0$contentDisplayed";
    }
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          contentDisplayed,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
