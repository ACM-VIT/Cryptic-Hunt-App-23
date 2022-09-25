import 'dart:math';

import 'package:cryptic_hunt/Providers/phase_notifier.dart';
import 'package:cryptic_hunt/Providers/question_group_list_notifier.dart';
import 'package:cryptic_hunt/screens/leaderboard_page.dart';
import 'package:cryptic_hunt/widgets/questionGroupList.dart';
import 'timedisplay.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

class CountDownTimer extends StatefulWidget {
  static String id = "CountDownTimer";
  const CountDownTimer({super.key});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 244, 234, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<PhaseNotifier>(
                builder: (context, value, child) => PhaseTimer(notifier: value),
              ),
              Padding(
                padding: EdgeInsets.only(top: 33, bottom: 20),
                child: Text(
                  "Prompts",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 18),
                ),
              ),
              Expanded(
                  child: ChangeNotifierProvider(
                create: (context) => QuestionGroupListNotifier(),
                builder: (context, child) => QuestionGroupList(
                    state: Provider.of<QuestionGroupListNotifier>(
                  context,
                )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class PhaseTimer extends StatefulWidget {
  PhaseTimer({super.key, required this.notifier});
  PhaseNotifier notifier;

  @override
  State<PhaseTimer> createState() => _PhaseTimerState();
}

class _PhaseTimerState extends State<PhaseTimer> {
  Timer? countDown;
  Duration myDuration = const Duration(seconds: 0);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    widget.notifier.phaseStream().listen((event) {
      // print("------------yygvu--------");
      // print(DateTime.parse(event.time).day);
      startTimer(DateTime.parse(event.time));
      // startTimer(DateTime(22, 10, 2));
      // print(DateTime(22, 10, 2).difference(DateTime.now()));
    });
    print("initState");
    // startTimer(DateTime.parse(widget.notifier.phase?.time ??
    //     DateTime(2022, 10, 2).toIso8601String()));
    startTimer(DateTime(2022, 9, 30, 8));

    super.initState();
  }

  void startTimer(DateTime target) {
    if (countDown != null) countDown!.cancel();
    myDuration = target.difference(DateTime.now());
    print("myDuratin $myDuration");
    countDown =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    if (mounted) {
      setState(() {
        final secondsRemaining = myDuration.inSeconds - 1;
        myDuration = Duration(seconds: secondsRemaining);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int hours = max(myDuration.inHours, 0);
    int minutes = max(myDuration.inMinutes.remainder(60), 0);
    int seconds = max(myDuration.inSeconds.remainder(60), 0);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cryptic Hunt",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(widget.notifier.phase?.phaseText ?? "Starts In",
                        style: Theme.of(context).textTheme.subtitle1),
                  ),
                ],
              ),
              const Expanded(child: SizedBox()),
              SvgPicture.asset('assets/Owl-7.svg')
            ],
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        )
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //   child: Container(
        //     decoration: const BoxDecoration(
        //         border: Border(bottom: BorderSide(color: Colors.orange))),
        //   ),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        ,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Text(
            widget.notifier.phase?.mainText ?? "Tick! Tock!",
            style:
                Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TimeDisplay(hours),
            Text(
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              ":",
            ),
            TimeDisplay(minutes),
            Text(
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
              ":",
            ),
            TimeDisplay(seconds),
          ],
        ),
      ],
    );
  }
}
