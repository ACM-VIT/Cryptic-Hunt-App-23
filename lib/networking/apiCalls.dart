import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpService {
  late Dio dio;
  final baseUrl = "https://swapi.dev/api/people/1";

  HttpService() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
  }

  Future<Response> getRequest() async {
    Response response;
    try {
      response = await dio.get(baseUrl);
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
      throw Exception(e.message);
    }
    //print(response);
    return response;
  }

  initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onError: (error, e) {
        if (kDebugMode) {
          print(error.message);
        }
      },
      onRequest: (request, e) {
        if (kDebugMode) {
          print("${request.method} ${request.path}");
        }
      },
      onResponse: (response, e) {
        if (kDebugMode) {
          print(response.data);
        }
      },
    ));
  }
}
