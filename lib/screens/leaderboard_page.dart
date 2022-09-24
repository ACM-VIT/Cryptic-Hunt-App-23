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
            ),
            if (Provider.of<LeaderBoardPageNotifier>(context).showTeamCard)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  height: 10,
                  thickness: 1.0,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            if (Provider.of<LeaderBoardPageNotifier>(context).showTeamCard)
              Container(
                  child: LeaderBoardListItem(
                      team: Provider.of<LeaderBoardPageNotifier>(context)
                          .leaderBoard!
                          .team!),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ))
          ],
        ),
      ),
    );
  }
}
