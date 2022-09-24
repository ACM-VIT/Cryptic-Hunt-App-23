import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:cryptic_hunt/networking/leaderboard_service.dart';
import 'package:cryptic_hunt/networking/profile_service.dart';
import 'package:cryptic_hunt/networking/util.dart';
import 'package:cryptic_hunt/networking/team_service.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerLazySingleton<MyDio>(
      () => MyDio(baseUrl: "http://20.193.148.31"));
  GetIt.I.registerLazySingleton<ApiService>(() => ApiService());

  GetIt.I.registerSingleton<GAuthService>(GAuthService());
  GetIt.I.registerSingleton<ProfileService>(ProfileService());

  GetIt.I.registerLazySingleton<LeaderBoardService>(
      () => LeaderBoardService("http://20.193.148.31"));

  GetIt.I.registerSingleton<TeamService>(TeamService('http://20.193.148.31'));
}
