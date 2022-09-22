import 'package:cryptic_hunt/data/user.dart';
import 'package:cryptic_hunt/networking/profile_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:cryptic_hunt/data/team.dart';

class ProfileNotifier extends ChangeNotifier {
  late ProfileService api;
  bool busy = false;
  User? user;
  Team? team;
  String? teamId = '';
  int points = 0;

  ProfileNotifier() {
    api = GetIt.I<ProfileService>();
  }

  Future<void> getUser() async {
    isBusy(true);
    user = await api.getUserDetails();
    teamId = user?.teamId;
    isBusy(false);
  }

  Future<void> getTeam() async {
    isBusy(true);
    team = await api.getTeamDetails(id: teamId);
    isBusy(false);
  }

  void isBusy(bool x) {
    if (x != busy) {
      busy = x;
      notifyListeners();
    }
  }
}
