import 'package:cryptic_hunt/Providers/leaderboard_page_notifier.dart';
import 'package:cryptic_hunt/widgets/leaderboard_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeaderBoardList extends StatefulWidget {
  LeaderBoardList({super.key, required this.state});
  LeaderBoardPageNotifier state;

  @override
  State<LeaderBoardList> createState() => _LeaderBoardListState();
}

class _LeaderBoardListState extends State<LeaderBoardList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => getLeaderBoard());

    super.initState();
  }

  Future<void> getLeaderBoard() async {
    widget.state.getLeaderBoard();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.state.busy)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: getLeaderBoard,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                itemCount: widget.state.leaderBoard?.leaderboard.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  String? assetName;
                  if (index == 0) {
                    assetName = 'assets/leaderboard/gold.svg';
                  } else if (index == 1) {
                    assetName = 'assets/leaderboard/silver.svg';
                  } else if (index == 2) {
                    assetName = 'assets/leaderboard/bronze.svg';
                  }
                  return LeaderBoardListItem(
                      team: widget.state.leaderBoard!.leaderboard[index],
                      index: index,
                      assetName: assetName);
                }));
  }
}
