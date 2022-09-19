import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login.dart';

class OnBoarding extends StatelessWidget {
  static String id = "OnBoarding";
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingPage(),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);
  final Widget svg1 = SvgPicture.asset('assets/onBoarding/a.svg');
  final Widget svg2 = SvgPicture.asset('assets/onBoarding/b.svg');
  final Widget svg3 = SvgPicture.asset('assets/onBoarding/c.svg');

  final controller = PageController(); //PageView controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crytic Hunt"),
        backgroundColor: const Color(0xffff7a01),
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
                    style: TextStyle(
                        color: Color(0xFF777777),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            //TODO1: put text and SmoothPageIndicator in column inside expanded
            Flexible(
              child: Container(
                constraints: const BoxConstraints(
                    minHeight: 200, minWidth: double.infinity),
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
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const Text(
                    "Experience the one of a kind hunt with us!",
                    style: TextStyle(
                        color: Color(0xFF777777),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
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
              margin: const EdgeInsets.all(30),
              alignment: Alignment.topCenter,
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
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    primary: const Color(0xFFFF7A01)),
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins-SemiBold',
                      fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
