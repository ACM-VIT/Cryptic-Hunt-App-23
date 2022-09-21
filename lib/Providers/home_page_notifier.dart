import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum HomePageState {
  loggedOut,
  loggedIn,
}

class HomePageNotifier extends ChangeNotifier {
  late GAuthService auth;
  HomePageState state = HomePageState.loggedOut;

  HomePageNotifier() {
    auth = GetIt.I<GAuthService>();
    auth.authStateOrTokenChange().listen((User? user) async {
      if (user == null) {
        if (state != HomePageState.loggedOut) {
          state = HomePageState.loggedOut;
          notifyListeners();
        }
      } else {
        if (state != HomePageState.loggedIn) {
          state = HomePageState.loggedIn;
          notifyListeners();
        }
        SharedPreferences pref = await SharedPreferences.getInstance();
        String token = await user.getIdToken();
        print("---------------------");
        print(token);
        print("---------------------");

        pref.setString('tokenId', token);
      }
    });
  }
}
