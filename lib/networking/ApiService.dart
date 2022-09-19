import 'package:dio/dio.dart';
import '/constants.dart';

class ApiService {
  ApiService(this.baseUrl);

  final String baseUrl;

  final Dio dio = Dio();

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
}
