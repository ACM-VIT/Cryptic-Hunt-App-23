import 'package:flutter/services.dart';

import 'leaderboard_page.dart';
import '/widgets/countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cryptic_hunt/widgets/hamburger_drawer.dart';

class NavigationManager extends StatefulWidget {
  const NavigationManager({super.key});

  static String id = "NavigationManager";

  @override
  State<NavigationManager> createState() => _NavigationManagerState();
}

class _NavigationManagerState extends State<NavigationManager> {
  final pages = [
    CountDownTimer(),
    const LeaderboardPage(),
  ];
  int currentIndex = 0;

  TextStyle selectedStyle(BuildContext context) {
    return TextStyle(color: Theme.of(context).primaryColor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0)
          ? AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              iconTheme: IconThemeData(
                  color: Theme.of(context).primaryColor, size: 30))
          : null,
      drawer: const HamburgerDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: BottomNavigationBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                elevation: 0,
                // backgroundColor: Colors.blue,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                // showSelectedLabels: false,
                // showUnselectedLabels: false,
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/navbar/cryptic_hunt_icon.svg',
                          color: const Color(0xffFF8618),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "The Hunt",
                          style: (currentIndex == 0)
                              ? selectedStyle(context)
                              : null,
                        ),
                      ],
                    ),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                      icon: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/navbar/leaderboard_icon.svg',
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Leaderboard",
                            style: (currentIndex == 1)
                                ? selectedStyle(context)
                                : null,
                          ),
                        ],
                      ),
                      label: ""),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
