import 'package:cryptic_hunt/Providers/google_sign_in_provider.dart';
import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:cryptic_hunt/networking/profile_service.dart';
import 'package:cryptic_hunt/networking/team_service.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerLazySingleton<ApiService>(
      () => ApiService("https://crypticstaging.acmvit.in"));
  GetIt.I.registerLazySingleton<GoogleSignInProvider>(
      () => GoogleSignInProvider());

  GetIt.I.registerSingleton<GAuthService>(GAuthService());
  GetIt.I.registerSingleton<ProfileService>(
      ProfileService('https://crypticstaging.acmvit.in'));

  GetIt.I.registerSingleton<TeamService>(
      TeamService('https://crypticstaging.acmvit.in'));
}
