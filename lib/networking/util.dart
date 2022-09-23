// ignore_for_file: deprecated_member_use

import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDio {
  static Dio? _dio;
  String baseUrl;

  static void _createDio(String baseUrl) {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
    _dio?.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, handler) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String? token = prefs.getString("tokenId");
        options.headers.addAll(
          {
            'Authorization': 'Bearer $token',
          },
        );
        return handler.next(options);
      },
      onError: (e, handler) async {
        if (e.response != null) {
          if (e.response!.statusCode == 401) {
            _dio!.interceptors.requestLock.lock();
            _dio!.interceptors.responseLock.lock();
            RequestOptions requestOptions = e.requestOptions;

            SharedPreferences pref = await SharedPreferences.getInstance();
            String? token =
                await GetIt.I<GAuthService>().auth.currentUser?.getIdToken();

            if (token != null) {
              pref.setString("tokenId", token);
              final opts = Options(method: requestOptions.method);
              _dio!.options.headers["Authorization"] = "Bearer " + token;

              _dio!.interceptors.requestLock.unlock();
              _dio!.interceptors.responseLock.unlock();
              final response = await _dio!.request(requestOptions.path,
                  options: opts,
                  cancelToken: requestOptions.cancelToken,
                  onReceiveProgress: requestOptions.onReceiveProgress,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters);
              if (response != null) {
                handler.resolve(response);
              } else {
                return null;
              }
            }
          } else {
            handler.next(e);
          }
        } else {
          handler.next(e);
        }
      },
    ));
  }

  MyDio({required this.baseUrl}) {
    _createDio(baseUrl);
  }

  get dio {
    if (_dio == null) {
      _createDio(baseUrl);
    }
    return _dio;
  }
}
