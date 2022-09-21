import 'package:flutter/material.dart';
import 'hamburger_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cryptic_hunt/widgets/countdowntimer.dart';

class HamburgerDrawer extends StatelessWidget {
  const HamburgerDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
            child: DrawerHeader(
              decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFFFF7A01), width: 1)),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/HamBurger/profilepic.svg'),
                  const SizedBox(
                    width: 15,
                    height: 0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'JEET KAUSHIK',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                      SizedBox(
                        height: 17,
                        width: 1,
                      ),
                      Text(
                        "50 PTS",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xFF777777)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          HamburgerItem(
            svgPicture: SvgPicture.asset('assets/HamBurger/timeline.svg'),
            text: 'Timeline',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CountDownTimer()),
              );
            },
          ),
          HamburgerItem(
            svgPicture: SvgPicture.asset('assets/HamBurger/archive.svg'),
            text: 'Archive',
          ),
          HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/resources.svg'),
              text: 'Resources'),
          HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/faq.svg'),
              text: 'Frequently Asked Questions'),
          HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/sponsors.svg'),
              text: 'Our Sponsors'),
          HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/profile.svg'),
              text: 'Profile'),
        ],
      ),
    );
  }
}
