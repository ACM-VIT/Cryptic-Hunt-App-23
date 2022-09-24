import 'package:cryptic_hunt/Providers/profile_notifier.dart';
import 'package:cryptic_hunt/Providers/team_notifier.dart';
import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:cryptic_hunt/networking/profile_service.dart';
import 'package:cryptic_hunt/screens/profile_page.dart';
import 'package:cryptic_hunt/screens/team_page.dart';
import 'package:cryptic_hunt/screens/timeline.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import '../screens/faq_screen.dart';
import 'hamburger_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cryptic_hunt/widgets/countdown_timer.dart';

class HamburgerDrawer extends StatelessWidget {
  HamburgerDrawer({Key? key}) : super(key: key);

  ProfileService profileService = GetIt.I<ProfileService>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          profileService.getUser()?.picture ??
                              "www.defaultImage.com"),
                    ),
                    const SizedBox(
                      width: 15,
                      height: 0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profileService.getUser()?.name ?? "loading...",
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
                  MaterialPageRoute(builder: (context) => const Timeline()),
                );
              },
            ),
            HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/archive.svg'),
              text: 'Archive',
            ),
            // HamburgerItem(
            //     svgPicture: SvgPicture.asset('assets/HamBurger/resources.svg'),
            //     text: 'Resources'),
            HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/faq.svg'),
              text: 'Frequently Asked Questions',
              onTap: () {
                Navigator.pushNamed(context, FaqScreen.id);
              },
            ),
            // HamburgerItem(
            //     svgPicture: SvgPicture.asset('assets/HamBurger/sponsors.svg'),
            //     text: 'Our Sponsors'),
            HamburgerItem(
              svgPicture: SvgPicture.asset('assets/HamBurger/profile.svg'),
              text: 'Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                            create: (_) => ProfileNotifier(),
                            builder: (context, child) {
                              return ProfilePage(
                                state: Provider.of<ProfileNotifier>(context),
                              );
                            },
                          )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
