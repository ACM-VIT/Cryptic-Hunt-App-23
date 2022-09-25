import 'package:cryptic_hunt/data/timeline_object.dart';
import 'package:get_it/get_it.dart';
import 'package:cryptic_hunt/networking/util.dart';
import 'package:dio/dio.dart';

class TimelineService {
  TimelineService() {
    dio = GetIt.I<MyDio>().dio;
  }

  late Dio dio;

  Future<List<TimelineObject>?> getTimelineObject({
    String endpoint = "/meta/timeline",
  }) async {
    try {
      Response response = await dio.get(
        endpoint,
      );
      print(response.data);
      if (response.statusCode == 200) {
        List<TimelineObject> timelineObject = (response.data)
            .map<TimelineObject>((i) => TimelineObject.fromJson(i))
            .toList();
        return timelineObject;
      }
    } on DioError catch (de, e) {
      print(
          "[ERROR_GET_QUESTION_GROUP] ${de.response} \n ${de.requestOptions.headers}");
      rethrow;
    }
  }
}
