import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cryptic_hunt/data/user.dart' as profile;
import 'package:cryptic_hunt/networking/profile_service.dart';

enum HomePageState { loggedOut, loggedIn, notInTeam, defaultScreen }

class HomePageNotifier extends ChangeNotifier {
  late GAuthService auth;
  late ProfileService profileService;
  HomePageState state = HomePageState.loggedOut;

  HomePageNotifier() {
    auth = GetIt.I<GAuthService>();
    auth.authState().listen((User? user) async {
      profileService = GetIt.I<ProfileService>();

      if (user == null) {
        if (state != HomePageState.loggedOut) {
          state = HomePageState.loggedOut;
          notifyListeners();
        }
      } else {
        //profile.User? profileUser = await profileService.getUserDetails();
        profile.User profileUser = profile.User('2', 'efa', 'fads', 'ads',
            'afsd', 'fa', 'asd', 'hhfh', 'afe', 'afds');
        if (profileUser != null && profileUser.teamId == null) {
          state = HomePageState.notInTeam;
          notifyListeners();
          return;
        }
        if (state != HomePageState.loggedIn) {
          state = HomePageState.loggedIn;
          notifyListeners();
        }

        SharedPreferences pref = await SharedPreferences.getInstance();
        String token = await user.getIdToken();
        pref.setString('tokenId', token);
      }
    });
  }
}
