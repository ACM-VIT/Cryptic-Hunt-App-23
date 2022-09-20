import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:dio/dio.dart';

class GoogleSignInProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  String? _accessToken;
  String? _idToken;

  bool signingIn = false;

  String? get accessToken => _accessToken;
  String? get idToken => _idToken;

  GoogleSignInAccount? get user => _user;
  final auth = FirebaseAuth.instance;

  ApiService apiService = ApiService('https://cryptic.aarav.wtf');

  Future login() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    _accessToken = googleAuth.accessToken;
    _idToken = googleAuth.idToken;

    signingIn = true;
    notifyListeners();

    final credential = GoogleAuthProvider.credential(
        accessToken: _accessToken, idToken: _idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);

    String? token = await auth.currentUser?.getIdToken(true);
    Response? response =
        await apiService.get(endpoint: '/users/profile', token: token);

    signingIn = false;

    print(response.toString());
    print(
        'JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJjjjjjjjjjjjjjjjjjjjjjjjjjjj $_accessToken');

    notifyListeners();
  }
}
