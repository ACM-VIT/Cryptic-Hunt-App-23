import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'google_sign_in_page.dart';

// class OnBoarding extends StatelessWidget {
//   static String id = "OnBoarding";
//   const OnBoarding({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: OnBoardingPage(),
//     );
//   }
// }

class OnBoarding extends StatelessWidget {
  static String id = 'OnBoarding';
  OnBoarding({Key? key}) : super(key: key);
  final Widget svg1 = SvgPicture.asset('assets/onBoarding/onboarding_1.svg');
  final Widget svg2 = SvgPicture.asset('assets/onBoarding/onboarding_2.svg');
  final Widget svg3 = SvgPicture.asset('assets/onBoarding/onboarding_3.svg');

  final controller = PageController(); //PageView controller

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              //TODO1: put text and SmoothPageIndicator in column inside expanded
              Flexible(
                child: PageView(
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    OnBoardingItem(
                      header: 'Build a team',
                      description:
                          'Talent may get lucky, but teamwork is built to win. So build a team so strong you don\'t know who the boss is.',
                      image: SvgPicture.asset(
                          'assets/onBoarding/onboarding_1.svg'),
                    ),
                    OnBoardingItem(
                      header: 'Solve problems',
                      description:
                          'Clear vision holds the key. You can\'t solve a problem until you\'re asking the right questions.',
                      image: SvgPicture.asset(
                          'assets/onBoarding/onboarding_2.svg'),
                    ),
                    OnBoardingItem(
                      header: 'Ace the leaderboard',
                      description:
                          'A winner never stops trying. In Cryptic Hunt, Imagination has a great deal to do with winning.',
                      image: SvgPicture.asset(
                          'assets/onBoarding/onboarding_3.svg'),
                    ),
                  ],
                ),
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
              Container(
                margin: const EdgeInsets.all(30),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GoogleSignInPage()));
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
      ),
    );
  }
}

class OnBoardingItem extends StatelessWidget {
  OnBoardingItem(
      {super.key,
      required this.header,
      required this.description,
      required this.image});

  String header;
  String description;
  SvgPicture image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        Text(header,
            style:
                Theme.of(context).textTheme.headline1?.copyWith(fontSize: 20)),
        const SizedBox(height: 60),
        image,
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 40, right: 40),
          child: Text(
            description,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
