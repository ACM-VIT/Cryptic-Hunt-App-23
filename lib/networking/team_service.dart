import 'package:cryptic_hunt/networking/util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/user.dart';
import '../data/team.dart';

class TeamService {
  TeamService() {
    dio = GetIt.I<MyDio>().dio;
  }

  late Dio dio;

  Future<Team?> createTeam(
      {String endpoint = '/teams/createteam',
      required String? teamname}) async {
    try {
      Response response =
          await dio.post(endpoint, data: {'teamname': teamname});

      print('--------------- TEAM DETAILS ------------------');
      print(response.statusMessage);
      print(response.statusCode);
      print('-----------------------------------------------');

      if (response.statusCode == 200) {
        Team team = Team.fromJson(response.data);
        return team;
      }
    } on DioError catch (de, e) {
      print("[ERROR_GET_USER] ${de.response} \n ${de.requestOptions.headers}");
    }
    return null;
  }

  Future<User?> joinTeam(
      {String endpoint = '/teams/jointeam', required String? teamcode}) async {
    try {
      Response response =
          await dio.post(endpoint, data: {'teamcode': teamcode});

      if (response.statusCode == 200) {
        User user = User.fromJson(response.data);
        return user;
      }
    } on DioError catch (de, e) {
      print("[ERROR_GET_USER] ${de.response} \n ${de.requestOptions.headers}");
    }
    return null;
  }
}
