import 'package:cryptic_hunt/data/timeline_object.dart';
import 'package:cryptic_hunt/networking/timeline_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class TimelinePageNotifier extends ChangeNotifier {
  bool busy = false;
  List<TimelineObject> timelineObjectList = [];
  late TimelineService api;

  TimelinePageNotifier() {
    api = GetIt.I<TimelineService>();
  }

  Future<void> getQuestionGroups({bool showLoading = true}) async {
    if (busy) return;
    try {
      isBusy(true && showLoading);
      timelineObjectList = await api.getTimelineObject() ?? [];
      if (showLoading == false) notifyListeners();
      isBusy(false);
    } catch (e) {
      isBusy(false);
      rethrow;
    }
  }

  void isBusy(bool x) {
    if (x != busy) {
      busy = x;
      notifyListeners();
    }
  }
}
