import 'package:cryptic_hunt/widgets/list_item.dart';
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
    "FSAKKL",
    "Snkalp",
    "ankalp",
    "Skalp",
    "Sankap",
    "Sanlp",
    "Harsh",
    "Sumona",
    "Himanshu",
    "Hahu",
    "manshu",
    "Hinshu",
    "Himashu",
    "Himanu",
    "Rohan",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 4),
            child: SvgPicture.asset('assets/leaderboard/leaderboard_head.svg'),
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
              // height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  itemCount: teamNames.length,
                  itemBuilder: (BuildContext context, int index) {
                    String profilePicturePath = 'assets/dude1.png';
                    int points = 50;
                    String assetName;
                    if (index == 0) {
                      assetName = 'assets/leaderboard/gold.svg';
                    } else if (index == 1) {
                      assetName = 'assets/leaderboard/silver.svg';
                    } else if (index == 2) {
                      assetName = 'assets/leaderboard/bronze.svg';
                    } else {
                      assetName = 'assets/leaderboard/empty_image.svg';
                    }
                    return ListTile(
                      leading: SizedBox(
                        width: 70,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text("${index + 1}"),
                            ),
                            CircleAvatar(
                              child: Image.asset(profilePicturePath),
                            ),
                          ],
                        ),
                      ),
                      title: SizedBox(
                          child: Row(
                        children: [
                          Text(teamNames[index]),
                          const SizedBox(width: 10),
                          SvgPicture.asset(assetName),
                        ],
                      )),
                      trailing: SizedBox(
                          width: 80,
                          child: Row(
                            children: [
                              Text("$points PTS"),
                            ],
                          )),
                    );

                    // if (index == 0) {
                    // return ListItem(
                    //     index,
                    //     teamNames[index],
                    //     'assets/leaderboard/gold.svg',
                    //     'assets/dude1.png',
                    //     50);
                    // } else if (index == 1) {
                    //   return ListItem(
                    //       index,
                    //       teamNames[index],
                    //       'assets/leaderboard/silver.svg',
                    //       'assets/dude1.png',
                    //       50);
                    // }
                    // if (index == 2) {
                    //   return ListItem(
                    //       index,
                    //       teamNames[index],
                    //       'assets/leaderboard/bronze.svg',
                    //       'assets/dude1.png',
                    //       50);
                    // } else {
                    //   return ListItem(
                    //       index,
                    //       teamNames[index],
                    //       'assets/leaderboard/empty_image.svg',
                    //       'assets/dude1.png',
                    //       50);
                    // }
                  })),

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
    );
  }
}
