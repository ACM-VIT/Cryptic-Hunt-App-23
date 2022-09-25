import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../data/question_group.dart';

class QuestionGroupListNotifier extends ChangeNotifier {
  bool busy = false;
  List<QuestionGroup> questionGroups = [];
  late ApiService api;

  QuestionGroupListNotifier() {
    api = GetIt.I<ApiService>();
  }

  Future<void> getQuestionGroups({bool showLoading = true}) async {
    if (busy) return;
    try {
      isBusy(true && showLoading);
      questionGroups =
          await api.getQuestionGroup(endpoint: "/questiongroups") ?? [];
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
