import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeaderboardList extends StatefulWidget {
  const LeaderboardList({super.key});

  @override
  State<LeaderboardList> createState() => _LeaderboardListState();
}

class _LeaderboardListState extends State<LeaderboardList> {
  final teamNames = [
    "Sankalp",
    "Harsh",
    "Sumona",
    "Himanshu",
    "Rohan",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          String currentTeamName = teamNames[index];
          String profilePicturePath = 'assets/dude1.png';
          int points = 50;

          if (index == 0) {
            String medalPath = 'assets/leaderboard/gold.svg';
            return ListTile(
              leading: Row(
                children: [
                  Text("${index + 1}"),
                  CircleAvatar(child: Image.asset(profilePicturePath)),
                ],
              ),
              title: Row(
                children: [
                  Text(currentTeamName),
                  const Expanded(child: SizedBox()),
                  SvgPicture.asset(medalPath),
                  const SizedBox(width: 10),
                  Text("${points.toString()} PTS"),
                ],
              ),
            );
          } else if (index == 1) {
            String medalPath = 'assets/leaderboard/silver.svg';
            return ListTile(
              leading: Row(
                children: [
                  Text("${index + 1}"),
                  CircleAvatar(child: Image.asset(profilePicturePath)),
                ],
              ),
              title: Row(
                children: [
                  Text(currentTeamName),
                  const Expanded(child: SizedBox()),
                  SvgPicture.asset(medalPath),
                  const SizedBox(width: 10),
                  Text("${points.toString()} PTS"),
                ],
              ),
            );
          } else if (index == 2) {
            String medalPath = 'assets/leaderboard/bronze.svg';
            return ListTile(
              leading: Row(
                children: [
                  Text("${index + 1}"),
                  CircleAvatar(child: Image.asset(profilePicturePath)),
                ],
              ),
              title: Row(
                children: [
                  Text(currentTeamName),
                  const Expanded(child: SizedBox()),
                  SvgPicture.asset(medalPath),
                  const SizedBox(width: 10),
                  Text("${points.toString()} PTS"),
                ],
              ),
            );
          } else {
            String medalPath = 'assets/leaderboard/empty_image.svg';
            return ListTile(
              leading: Row(
                children: [
                  Text("${index + 1}"),
                  CircleAvatar(child: Image.asset(profilePicturePath)),
                ],
              ),
              title: Row(
                children: [
                  Text(currentTeamName),
                  const Expanded(child: SizedBox()),
                  SvgPicture.asset(medalPath),
                  const SizedBox(width: 10),
                  Text("${points.toString()} PTS"),
                ],
              ),
            );
          }
        });
  }
}
