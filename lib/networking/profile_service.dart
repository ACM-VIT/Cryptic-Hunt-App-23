import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/user.dart';
import '../data/team.dart';

class ProfileService {
  ProfileService(this.baseUrl) {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(
        InterceptorsWrapper(onRequest: (RequestOptions options, handler) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("tokenId");
      options.headers.addAll(
        {
          'Authorization': 'Bearer $token',
        },
      );
      return handler.next(options);
    }));
  }

  final String baseUrl;
  late Dio dio;

  Future<User?> getUserDetails({String endpoint = '/users/profile'}) async {
    try {
      Response response = await dio.get(
        endpoint,
      );
      print('-------------------USER DETAILS ----------------------\n');
      print(response.data);
      print('------------------------------------------------------');
      if (response.statusCode == 200) {
        User user = User.fromJson(response.data);
        return user;
      }
    } on DioError catch (de, e) {
      print("[ERROR_GET_USER] ${de.response} \n ${de.requestOptions.headers}");
    }
    return null;
  }

  Future<Team?> getTeamDetails(
      {required String? id, String endpoint = '/teams'}) async {
    try {
      Response response = await dio.get(
        endpoint,
        queryParameters: {
          'id': id,
        },
      );
      print('-------------------TEAM DETAILS ----------------------');
      print(response.data);
      print('------------------------------------------------------');

      if (response.statusCode == 200) {
        Team team = Team.fromJson(response.data);
        return team;
      }
    } on DioError catch (de, e) {
      print("[ERROR_GET_USER] ${de.response} \n ${de.requestOptions.headers}");
    }
    return null;
  }
}
