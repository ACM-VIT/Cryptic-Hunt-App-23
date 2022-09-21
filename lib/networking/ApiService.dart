import 'package:cryptic_hunt/data/question_group.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/constants.dart';

class ApiService {
  ApiService(this.baseUrl) {
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
    }
  }

  Future<List<QuestionGroup>?> getQuestionGroupDetail({
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
        List<QuestionGroup> questionGroups = (response.data)
            .map<QuestionGroup>((i) => QuestionGroup.fromJson(i))
            .toList();
        return questionGroups;
      }
    } on DioError catch (de, e) {
      print(
          "[ERROR_GET_QUESTION_GROUP] ${de.response} \n ${de.requestOptions.headers}");
    }
  }
}
