import 'package:cryptic_hunt/screens/leaderboard.dart';
import 'package:cryptic_hunt/widgets/countdowntimer.dart';
import 'package:flutter/material.dart';

class NavigationManager extends StatefulWidget {
  const NavigationManager({super.key});

  @override
  State<NavigationManager> createState() => _NavigationManagerState();
}

class _NavigationManagerState extends State<NavigationManager> {
  int currentIndex = 1;
  final pages = [const Leaderboard(), const CountDownTimer()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // fixedColor: Colors.white,

        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: "Leaderboard",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Cryptic Hunt",
              backgroundColor: Colors.red),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
