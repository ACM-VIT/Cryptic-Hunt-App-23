import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:get_it/get_it.dart';

void setup() {
  GetIt.I.registerLazySingleton<ApiService>(
      () => ApiService("https://cryptic.aarav.wtf/"));
}
