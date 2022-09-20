import 'package:cryptic_hunt/data/question_group.dart';
import 'package:dio/dio.dart';
import '/constants.dart';

class ApiService {
  ApiService(this.baseUrl);

  final String baseUrl;

  final Dio dio = Dio();

  //todo: try catch
  Future<Response?> get(
      {required String endpoint, required String? token, String? data}) async {
    Response response = await dio.get(
      baseUrl + endpoint,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  Future<List<QuestionGroup>?> getQuestionGroup({
    required String endpoint,
    required String? token,
  }) async {
    try {
      Response response = await dio.get(
        baseUrl + endpoint,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print(response.data);
      if (response.statusCode == 200) {
        List<QuestionGroup> questionGroups = (response.data)
            .map<QuestionGroup>((i) => QuestionGroup.fromJson(i))
            .toList();
        return questionGroups;
      }
    } catch (e) {
      print("[ERROR_GET_QUESTION_GROUP] ${e.toString()}");
    }
  }
}
