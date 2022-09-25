import 'package:cryptic_hunt/networking/profile_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';
import 'package:cryptic_hunt/data/user.dart' as profile;

class GAuthService {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  String? _accessToken;
  String? _idToken;
  String? get accessToken => _accessToken;
  String? get idToken => _idToken;

  GoogleSignInAccount? get user => _user;
  final auth = FirebaseAuth.instance;

  Stream<User?> authState() => auth.authStateChanges();

  Future logout() async {
    await auth.signOut();
    await googleSignIn.signOut();
  }

  Future login() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return false;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      _accessToken = googleAuth.accessToken;
      _idToken = googleAuth.idToken;

      final credential = GoogleAuthProvider.credential(
          accessToken: _accessToken, idToken: _idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      // String? token = await auth.currentUser?.getIdToken();

    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
