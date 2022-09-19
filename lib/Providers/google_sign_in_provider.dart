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

  String? get accessToken => _accessToken;
  String? get idToken => _idToken;

  GoogleSignInAccount? get user => _user;
  final auth = FirebaseAuth.instance;

  ApiService apiService = ApiService('http://65.1.18.154:8081');

  Future login() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: _accessToken, idToken: _idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);

    _accessToken = await auth.currentUser?.getIdToken();
    _idToken = googleAuth.idToken;

    Response? response =
        await apiService.get(endpoint: '/users/profile', token: _accessToken);

    print(response.toString());
    print(
        'JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJjjjjjjjjjjjjjjjjjjjjjjjjjjj $_accessToken');

    notifyListeners();
  }
}
