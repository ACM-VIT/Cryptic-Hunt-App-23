import 'package:cryptic_hunt/data/buy_hint.dart';
import 'package:cryptic_hunt/data/hint.dart';
import 'package:cryptic_hunt/data/question.dart';
import 'package:cryptic_hunt/data/question_group_detail.dart';
import 'package:cryptic_hunt/data/submission.dart';
import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:cryptic_hunt/networking/gauth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../data/answer.dart';

class QuestionScreenNotifier extends ChangeNotifier {
  bool busy = true;
  late ApiService api;
  late GAuthService auth;
  late QuestionGroupDetail? questionGroupDetail;
  bool showScanButton = true;
  int currentIndex = 0;

  QuestionScreenNotifier() {
    api = GetIt.I<ApiService>();
  }

  void toggleScanButton(bool x) {
    if (x != showScanButton) {
      showScanButton = x;
      notifyListeners();
    }
  }

  Future<void> getQuestionGroupDetail(String id) async {
    isBusy(true);
    questionGroupDetail = await api.getQuestionGroupDetail(qId: id);
    for (int i = 0; i < (questionGroupDetail?.questions?.length ?? 0); i++) {
      if (!(questionGroupDetail?.questions?[i].solved ?? true)) {
        currentIndex = i;
        break;
      }
    }
    isBusy(false);
  }

  //todo: instead of seding false , send null with error occured message
  Future<bool> submitAns(Answer answer) async {
    isBusy(true);
    Submission? submission = await api.submitAnswer(answer: answer);
    isBusy(false);
    return (submission == null) ? false : submission.isCorrect;
  }

  Future<Hint?> getHint(BuyHint buyHint) async {
    isBusy(true);
    Hint? hint = await api.buyHint(buyHint: buyHint);
    if (hint != null)
      questionGroupDetail!.questions![buyHint.seq - 1].hint = hint.hint;
    isBusy(false);
    return hint;
  }

  void changePage(int x) {
    if (x != currentIndex) {
      currentIndex = x;
      notifyListeners();
    }
  }

  void isBusy(bool x) {
    if (x != busy) {
      busy = x;
      notifyListeners();
    }
  }
}
