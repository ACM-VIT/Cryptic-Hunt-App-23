import 'package:cryptic_hunt/data/answer.dart';
import 'package:cryptic_hunt/data/buy_hint.dart';
import 'package:cryptic_hunt/data/leaderboard.dart';
import 'package:cryptic_hunt/data/question_group.dart';
import 'package:cryptic_hunt/data/question_group_detail.dart';
import 'package:cryptic_hunt/data/submission.dart';
import 'package:cryptic_hunt/screens/leaderboard.dart';
import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/hint.dart';
import '../data/question.dart';
import '/constants.dart';

class LeaderBoardService {
  LeaderBoardService(this.baseUrl) {
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
      }
    } on DioError catch (de, e) {
      print(
          "[ERROR_GET_LEADERBOARD] ${de.response} \n ${de.requestOptions.headers}");
      rethrow;
    }
  }
}
