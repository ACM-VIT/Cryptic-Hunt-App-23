import 'package:cryptic_hunt/Providers/question_group_list_notifier.dart';
import 'package:cryptic_hunt/widgets/questionGroupList.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../data/question_group.dart';
import '../networking/ApiService.dart';

class ArchivePageNotifier extends QuestionGroupListNotifier {
  ArchivePageNotifier() : super();

  @override
  Future<void> getQuestionGroups() async {
    try {
      isBusy(true);
      questionGroups = await api.getArchive() ?? [];
      isBusy(false);
    } catch (e) {
      isBusy(false);
      rethrow;
    }
  }
}
