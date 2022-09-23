import 'package:cryptic_hunt/networking/util.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/user.dart';
import '../data/team.dart';

class ProfileService {
  ProfileService() {
    dio = GetIt.I<MyDio>().dio;
  }

  late Dio dio;
  User? _user;
  Team? _team;

  Future<User?> get user async {
    if (_user == null) {
      await getUserDetails();
    }
    return _user;
  }

  // Future<Team?> get team async {
  //   if (_team == null && _user != null) {
  //     await getTeamDetails(id: _user!.teamId);
  //   }

  //   return _team;
  // }

  Future<User?> getUserDetails({String endpoint = '/users/profile'}) async {
    try {
      Response response = await dio.get(
        endpoint,
      );
      // print('-------------------USER DETAILS ----------------------\n');
      // print(response.data);
      // print('------------------------------------------------------');
      if (response.statusCode == 200) {
        _user = User.fromJson(response.data);
        return _user;
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
