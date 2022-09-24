import 'package:cryptic_hunt/data/answer.dart';
import 'package:cryptic_hunt/data/buy_hint.dart';
import 'package:cryptic_hunt/data/question_group.dart';
import 'package:cryptic_hunt/data/question_group_detail.dart';
import 'package:cryptic_hunt/data/submission.dart';
import 'package:cryptic_hunt/networking/util.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../data/hint.dart';
import '../data/question.dart';
import '/constants.dart';

class ApiService {
  ApiService() {
    dio = GetIt.I<MyDio>().dio;
  }

  late Dio dio;

  //todo: try catch
  Future<Response?> get(
      {required String endpoint, required String? token, String? data}) async {
    Response response = await dio.get(
      endpoint,
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  Future<List<QuestionGroup>?> getQuestionGroup({
    String endpoint = "/questiongroups",
  }) async {
    try {
      Response response = await dio.get(
        endpoint,
      );
      print(response.data);
      if (response.statusCode == 200) {
        List<QuestionGroup> questionGroups = (response.data)
            .map<QuestionGroup>((i) => QuestionGroup.fromJson(i))
            .toList();
        return questionGroups;
      }
    } on DioError catch (de, e) {
      print(
          "[ERROR_GET_QUESTION_GROUP] ${de.response} \n ${de.requestOptions.headers}");
      rethrow;
    }
  }

  Future<QuestionGroupDetail?> getQuestionGroupDetail({
    String endpoint = "/questiongroups/",
    required String qId,
  }) async {
    try {
      Response response = await dio.get(
        endpoint + qId,
      );
      print(response.data);
      if (response.statusCode == 200) {
        //change question group to question group detail
        QuestionGroupDetail questionGroupDetail =
            QuestionGroupDetail.fromJson(response.data);
        return questionGroupDetail;
      }
    } on DioError catch (de, e) {
      print(
          "[ERROR_GET_QUESTION_GROUP_DETAIL] ${de.response} \n ${de.requestOptions.headers}");
    }
  }

  Future<Submission?> submitAnswer({
    String endpoint = "/submissions/submit",
    required Answer answer,
  }) async {
    try {
      Response response = await dio.post(endpoint, data: answer.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        //change question group to question group detail
        Submission submission = Submission.fromJson(response.data);
        return submission;
      }
    } on DioError catch (de, e) {
      print(
          "[ERROR_POST_SUBMISSION] ${de.response} \n ${de.requestOptions.headers}");
    }
  }

  Future<Hint?> buyHint({
    String endpoint = "/submissions/buyhint",
    required BuyHint buyHint,
  }) async {
    try {
      Response response = await dio.post(endpoint, data: buyHint.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        //change question group to question group detail
        Hint hint = Hint.fromJson(response.data);
        return hint;
      }
    } on DioError catch (de, e) {
      print("[ERROR_POST_HINT] ${de.response} \n ${de.requestOptions.headers}");
    }
  }
}
