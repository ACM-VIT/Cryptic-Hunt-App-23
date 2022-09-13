import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final Widget svg1 = SvgPicture.asset('assets/onBoarding/a.svg');
  final Widget svg2 = SvgPicture.asset('assets/onBoarding/b.svg');
  final Widget svg3 = SvgPicture.asset('assets/onBoarding/c.svg');

  final controller = PageController(); //PageView controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF7A01),
        title: const Text("Cryptic Hunt"),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    controller.animateToPage(
                      2,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                  child: const Text(
                    "SKIP",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 5,
              child: PageView(
                controller: controller,
                scrollDirection: Axis.horizontal,
                children: [
                  svg1,
                  svg2,
                  svg3,
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text("Experience the one of a kind hunt with us!"),
                  const SizedBox(
                    height: 10,
                  ),
                  SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const WormEffect(
                      spacing: 16,
                      radius: 10,
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.grey,
                      activeDotColor: Colors.black,
                      paintStyle: PaintingStyle.fill,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  double? currentpage = controller.page;
                  if (currentpage! < 2) {
                    currentpage += 1;
                    controller.animateToPage(
                      currentpage.toInt(),
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    primary: const Color(0xFFFF7A01)),
                child: const Text(
                  "NEXT",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
