import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cryptic_hunt/Providers/LoadingScreen/HomeScreenLoadingPercentage.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingScreen extends StatelessWidget {
  static String id = "MyHomePage";
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crytic Hunt"),
        backgroundColor: const Color(0xffff7a01),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Consumer<Percentage>(
                builder: (context, percentage, child) => SizedBox(
                      width: double.infinity,
                      height: 18,
                      child: LinearPercentIndicator(
                        barRadius: const Radius.circular(10),
                        lineHeight: 18,
                        percent: percentage.getPercentage(),
                        backgroundColor: const Color(0xffebe7e7),
                        progressColor: const Color(0xffff7a01),
                      ),
                    )),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/Loading/Owl.svg'),
                  const Text(
                    "Loading...",
                    style: TextStyle(
                        color: Color(0xff777777),
                        fontFamily: 'NotoSans',
                        fontSize: 24),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
