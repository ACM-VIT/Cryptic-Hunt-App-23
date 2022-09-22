import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListItem extends StatelessWidget {
  final int index;
  final String currentTeamName;
  final String medalPath;
  final int points;
  final String profilePicturePath;
  const ListItem(this.index, this.currentTeamName, this.medalPath,
      this.profilePicturePath, this.points,
      {super.key});

  @override
  Widget build(BuildContext context) {
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
}
