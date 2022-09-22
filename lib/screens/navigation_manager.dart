import 'leaderboard.dart';
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
  final pages = [const Leaderboard(), const CountdownTimer()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cryptic Hunt"),
        backgroundColor: const Color(0xffff7a01),
      ),
      drawer: const HamburgerDrawer(),
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: SizedBox(
        height: 90,
        child: BottomNavigationBar(
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
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: SvgPicture.asset(
                  'assets/navbar/leaderboard_icon.svg',
                ),
              ),
              label: "Leaderboard",
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: SvgPicture.asset(
                  'assets/navbar/cryptic_hunt_icon.svg',
                  color: const Color(0xffFF8618),
                ),
              ),
              label: "The Hunt",
            ),
          ],
        ),
      ),
    );
  }
}
