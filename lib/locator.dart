import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:cryptic_hunt/networking/profile_service.dart';
import 'package:cryptic_hunt/networking/util.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerLazySingleton<MyDio>(
      () => MyDio(baseUrl: "https://crypticstaging.acmvit.in/"));
  GetIt.I.registerLazySingleton<ApiService>(() => ApiService());

  GetIt.I.registerSingleton<GAuthService>(GAuthService());
  GetIt.I.registerSingleton<ProfileService>(ProfileService());
}
