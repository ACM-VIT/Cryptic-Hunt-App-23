import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class LoginPageNotifier extends ChangeNotifier {
  bool busy = false;
  late ApiService api;
  late GAuthService auth;

  LoginPageNotifier() {
    api = GetIt.I<ApiService>();
    auth = GetIt.I<GAuthService>();
  }

  Future<void> login() async {
    isBusy(true);
    await auth.login();
    isBusy(false);
  }

  void isBusy(bool x) {
    if (x != busy) {
      busy = x;
      notifyListeners();
    }
  }
}
