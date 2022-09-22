import 'package:cryptic_hunt/data/leaderboard.dart';
import 'package:cryptic_hunt/networking/leaderboard_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class LeaderBoardPageNotifier extends ChangeNotifier {
  bool busy = true;
  LeaderBoardService api = GetIt.I<LeaderBoardService>();
  bool showTeamCard = false;
  LeaderBoard? leaderBoard;

  Future<void> getLeaderBoard(String id) async {
    isBusy(true);
    leaderBoard = await api.getLeaderBoard();
    if (leaderBoard?.currentTeam != null) {
      showTeamCard = true;
    }
    isBusy(false);
  }

  void isBusy(bool x) {
    if (x != busy) {
      busy = x;
      notifyListeners();
    }
  }
}
