import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import '../data/user.dart';
import '../data/team.dart';
import 'package:cryptic_hunt/networking/team_service.dart';

enum PageState {
  menu,
  createTeam,
  joinTeam,
}

class TeamNotifier extends ChangeNotifier {
  late TeamService _api;
  bool busy = false;
  Team? team;
  PageState pageState = PageState.menu;
  bool codeGenerated = false;

  void updatePageState(PageState newPageState) {
    if (pageState != newPageState) {
      pageState = newPageState;
      notifyListeners();
    }
  }

  void updateCodeGeneration(bool x) {
    if (codeGenerated != x) {
      codeGenerated = x;
      notifyListeners();
    }
  }

  TeamNotifier() {
    _api = GetIt.I<TeamService>();
  }

  Future<bool> createTeam(String? teamname) async {
    isBusy(true);
    team = await _api.createTeam(teamname: teamname);
    isBusy(false);
    if (team == null) {
      // create team failed
      return false;
    } else {
      // create team successful
      return true;
    }
  }

  Future<bool> joinTeam(String? teamcode) async {
    isBusy(true);
    User? user = await _api.joinTeam(teamcode: teamcode);
    isBusy(false);
    if (user == null || user.teamId == null) {
      // join team failed
      return false;
    } else {
      // join team successful
      return true;
    }
  }

  void isBusy(bool x) {
    if (busy != x) {
      busy = x;
      notifyListeners();
    }
  }
}
