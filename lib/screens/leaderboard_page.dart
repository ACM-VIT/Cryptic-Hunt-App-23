import 'package:cryptic_hunt/Providers/leaderboard_page_notifier.dart';
import 'package:cryptic_hunt/widgets/leaderboard_list.dart';
import 'package:cryptic_hunt/widgets/leaderboard_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  static String id = "Leaderboard";

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  // final teamNames = [
  //   "FSAKKL",
  //   "Snkalp",
  //   "ankalp",
  //   "Skalp",
  //   "Sankap",
  //   "Sanlp",
  //   "Harsh",
  //   "Sumona",
  //   "Himanshu",
  //   "Hahu",
  //   "manshu",
  //   "Hinshu",
  //   "Himashu",
  //   "Himanu",
  //   "Rohan",
  // ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 4),
              child:
                  SvgPicture.asset('assets/leaderboard/leaderboard_head.svg'),
            ),

            //font Not loading
            Padding(
              padding: EdgeInsets.only(bottom: 8.0, top: 20),
              child: Text("the cryptic hunt",
                  style: Theme.of(context).textTheme.headline2),
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                    "Do you have what it takes to be on the leaderboard?",
                    style: Theme.of(context).textTheme.subtitle1)),
            // const Text(
            //   "Time remaining",
            //   style: TextStyle(
            //     color: Color(0xffFF8618),
            //   ),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                height: 10,
                thickness: 1.0,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Expanded(
              // height: MediaQuery.of(context).size.height * 0.6,
              child: Consumer<LeaderBoardPageNotifier>(
                builder: (context, value, child) =>
                    LeaderBoardList(state: value),
              ),

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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(
                height: 10,
                thickness: 1.0,
                color: Theme.of(context).primaryColor,
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
    );
  }
}
