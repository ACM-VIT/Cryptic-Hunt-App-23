import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class GoogleSignInProvider with ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  String? _accessToken;
  String? _idToken;

  String? get accessToken => _accessToken;
  String? get idToken => _idToken;

  GoogleSignInAccount? get user => _user;
  final auth = FirebaseAuth.instance;

  Future login() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    _accessToken = googleAuth.accessToken;
    _idToken = googleAuth.idToken;

    final credential = GoogleAuthProvider.credential(
        accessToken: _accessToken, idToken: _idToken);

    await FirebaseAuth.instance.signInWithCredential(credential);

    String? x = await auth.currentUser?.getIdToken();
    print(
        'JJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJJjjjjjjjjjjjjjjjjjjjjjjjjjjj $x');
    print(accessToken);
    print(idToken);

    notifyListeners();
  }
}
