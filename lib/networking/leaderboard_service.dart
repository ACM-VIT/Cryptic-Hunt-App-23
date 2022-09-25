import 'package:cryptic_hunt/data/answer.dart';
import 'package:cryptic_hunt/data/buy_hint.dart';
import 'package:cryptic_hunt/data/leaderboard.dart';
import 'package:cryptic_hunt/data/question_group.dart';
import 'package:cryptic_hunt/data/question_group_detail.dart';
import 'package:cryptic_hunt/data/submission.dart';
import 'package:cryptic_hunt/data/team.dart';
import 'package:cryptic_hunt/networking/util.dart';
import 'package:cryptic_hunt/screens/leaderboard_page.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/hint.dart';
import '../data/question.dart';
import '/constants.dart';

class LeaderBoardService {
  LeaderBoardService() {
    dio = GetIt.I<MyDio>().dio;
  }

  late Dio dio;

  Future<LeaderBoard?> getLeaderBoard({
    String endpoint = "/teams/leaderboard",
  }) async {
    try {
      Response response = await dio.get(
        endpoint,
      );
      print(response.data);
      if (response.statusCode == 200) {
        LeaderBoard leaderBoard = LeaderBoard.fromJson(response.data);
        return leaderBoard;
        // List<Team> teams =
        //     (response.data).map<Team>((i) => Team.fromJson(i)).toList();
        // return LeaderBoard(null, teams);
      }
    } on DioError catch (de, e) {
      print(
          "[ERROR_GET_LEADERBOARD] ${de.response} \n ${de.requestOptions.headers}");
      rethrow;
    }
  }
}
