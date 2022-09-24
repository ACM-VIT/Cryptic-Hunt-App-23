import 'package:cryptic_hunt/data/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cryptic_hunt/data/team.dart';

class LeaderBoardListItem extends StatelessWidget {
  LeaderBoardListItem(
      {super.key, required this.team, this.index, this.assetName});
  int? index;
  Team team;
  String? assetName;
  String profilePicturePath = 'assets/dude1.png';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              (index == null) ? team.rank.toString() : "${index! + 1}",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(profilePicturePath),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              team.name,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(fontSize: 16, color: Colors.black),
            ),
          ),
          if (assetName != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(assetName!),
            ),
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${team.points} PTS",
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}
