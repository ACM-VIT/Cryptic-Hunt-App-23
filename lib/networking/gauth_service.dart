import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dio/dio.dart';

class GAuthService {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;

  String? _accessToken;
  String? _idToken;
  String? get accessToken => _accessToken;
  String? get idToken => _idToken;

  GoogleSignInAccount? get user => _user;
  final auth = FirebaseAuth.instance;

  Stream<User?> authStateOrTokenChange() => auth.idTokenChanges();

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

      String? token = await auth.currentUser?.getIdToken(true);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
