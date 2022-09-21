import 'package:cryptic_hunt/Providers/google_sign_in_provider.dart';
import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerLazySingleton<ApiService>(
      () => ApiService("http://ec2-3-221-42-199.compute-1.amazonaws.com"));
  GetIt.I.registerLazySingleton<GoogleSignInProvider>(
      () => GoogleSignInProvider());

  GetIt.I.registerSingleton<GAuthService>(GAuthService());
}
