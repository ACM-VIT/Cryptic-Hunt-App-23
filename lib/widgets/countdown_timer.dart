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
  Timer? countDown;
  Duration myDuration = const Duration(seconds: 0);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    myDuration = DateTime(2022, 9, 25, 8).difference(DateTime.now());
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

  int index = 0;
  final pages = [
    // const MyHomePage(),
    const CountDownTimer(),
    const LeaderboardPage()
  ];

  @override
  Widget build(BuildContext context) {
    int hours = myDuration.inHours;
    int minutes = myDuration.inMinutes.remainder(60);
    int seconds = myDuration.inSeconds.remainder(60);

    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 244, 234, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Text("Phase 1",
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
                  "Tick! Tock!",
                  style: Theme.of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(fontSize: 20),
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
                    state: Provider.of<QuestionGroupListNotifier>(context,
                        listen: false)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
