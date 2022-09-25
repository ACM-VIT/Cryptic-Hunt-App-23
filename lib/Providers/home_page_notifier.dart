import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cryptic_hunt/data/user.dart' as profile;
import 'package:cryptic_hunt/networking/profile_service.dart';

enum HomePageState {
  loggedOut,
  loggedIn,
  notInTeam,
  onBoardingScreen,
}

class HomePageNotifier extends ChangeNotifier {
  late GAuthService auth;
  late ProfileService profileService;
  HomePageState state = HomePageState.onBoardingScreen;

  HomePageNotifier() {
    auth = GetIt.I<GAuthService>();
    profileService = GetIt.I<ProfileService>();
    print('profile service ${profileService}');
    auth.authState().listen((User? user) async {
      print('yes');
      print(user);
      if (user == null) {
        if (state != HomePageState.onBoardingScreen) {
          state = HomePageState.onBoardingScreen;
          notifyListeners();
          return;
        }

        // if (state != HomePageState.loggedOut) {
        //   state = HomePageState.loggedOut;
        //   notifyListeners();
        //   return;
        // }
      } else {
        //profile.User? profileUser = profileService.getUser();
        profile.User? profileUser =
            await GetIt.I<ProfileService>().getUserDetails();

        print("yes");
        print(profileUser);
        if (profileUser != null && profileUser.teamId == null) {
          state = HomePageState.notInTeam;
          notifyListeners();
          return;
        }
        if (profileUser != null &&
            profileUser.teamId != null &&
            state != HomePageState.loggedIn) {
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
