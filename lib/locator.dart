import 'package:cryptic_hunt/Providers/google_sign_in_provider.dart';
import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:cryptic_hunt/networking/leaderboard_service.dart';
import 'package:cryptic_hunt/networking/profile_service.dart';
import 'package:get_it/get_it.dart';

void setup() {

  String baseURL = "http://ec2-3-221-42-199.compute-1.amazonaws.com";
  GetIt.I.registerLazySingleton<ApiService>(() => ApiService(baseURL));

  GetIt.I.registerLazySingleton<GoogleSignInProvider>(
      () => GoogleSignInProvider());
  GetIt.I.registerLazySingleton<LeaderBoardService>(
      () => LeaderBoardService(baseURL));

  GetIt.I.registerSingleton<GAuthService>(GAuthService());

  GetIt.I.registerSingleton<ProfileService>(ProfileService(baseURL));

}
