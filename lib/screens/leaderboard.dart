import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  static String id = "Leaderboard";

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  final teamNames = [
    "Sankalp",
    "Harsh",
    "Sumona",
    "Himanshu",
    "Rohan",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child:
                    SvgPicture.asset('assets/leaderboard/leaderboard_head.svg'),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "the cryptic hunt",
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    fontFamily: 'fonts/NotoSans/SemiBoldItalic.ttf',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "Do you have what it takes to be on the leaderboard?",
                  style: TextStyle(
                    fontFamily: 'fonts/Poppins/Poppins-Medium.ttf',
                  ),
                ),
              ),
              const Text(
                "Time remaining",
                style: TextStyle(
                  color: Color(0xffFF8618),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  height: 10,
                  thickness: 1.0,
                  color: Color(0xffFF8618),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    children: [
                      Text('1'),
                      Text('1'),
                      Text('1'),
                      Text('1'),
                      Text('1'),
                      Text('1'),
                    ],
                  ),
                ),
              ),
              // Flexible(
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       physics: NeverScrollableScrollPhysics(),
              //       itemCount: 5,
              //       itemBuilder: (BuildContext context, int index) {
              //         String currentTeamName = teamNames[index];
              //         String profilePicturePath = 'assets/dude1.png';
              //         int points = 50;

              //         return ListTile(
              //           title: Text(currentTeamName),
              //           leading: Row(
              //             children: [
              //               Text("${index + 1}"),
              //               const SizedBox(
              //                 width: 10,
              //               ),
              //               Image.asset(profilePicturePath),
              //             ],
              //           ),
              //           trailing: Text("$points PTS"),
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
