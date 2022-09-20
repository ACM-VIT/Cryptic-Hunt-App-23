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

  //todo: remove access token from here
  Future<void> getQuestionGroups(String token) async {
    isBusy(true);
    questionGroups = await api.getQuestionGroup(
            endpoint: "questiongroups",
            token:
                "eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiQ2hpcmF5dSBTaGFybWEiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUxtNXd1M3dkeVdFX2dicXRpd1VWNndUYjF5NHpOd3pxdXNYSDNVZmRSSkRYUT1zOTYtYyIsImlzcyI6Imh0dHBzOi8vc2VjdXJldG9rZW4uZ29vZ2xlLmNvbS9jcnlwdGljLWh1bnQtNGM5ZmIiLCJhdWQiOiJjcnlwdGljLWh1bnQtNGM5ZmIiLCJhdXRoX3RpbWUiOjE2NjM3MTAxODMsInVzZXJfaWQiOiJCNGhsSXRPMGx3WUxrQWFCUEpBVkVGNUd6YmsxIiwic3ViIjoiQjRobEl0TzBsd1lMa0FhQlBKQVZFRjVHemJrMSIsImlhdCI6MTY2MzcxMDE4NiwiZXhwIjoxNjYzNzEzNzg2LCJlbWFpbCI6InRoZWNoaXJheXUwMkBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwMTY5MzI0OTUxOTk4MzQwNjY1MiJdLCJlbWFpbCI6WyJ0aGVjaGlyYXl1MDJAZ21haWwuY29tIl19LCJzaWduX2luX3Byb3ZpZGVyIjoiZ29vZ2xlLmNvbSJ9fQ.U51y6rLwnLedojNv3rWU1WlKkM6i4u9pVaMZ3Fa6OfMjuSGUsx7cis8hEeZf04CpmpOEhwuHuRy4wZNedzw8tx1gXpcTlrShToZ3H3HYowlGaRbxz6rWTZXfucAf7WZqoO6ZQKPZR26aD_8Ke5l0z9k3-10ZUchAi3rgQZmxfnvT-MM8-FgHZTJhBXxrzVmSu0u2HJ9B7hnJvqP1S2lfHxETN8T_rpyXJvkAe4xfTqmiHArjSMv6yDcAd9fc0s73FNw4jaNn47-VUsm7qIVDf2APs6Yx4SO1LQuDwgkqQ32dZUbJh_zH16hyrxr719Xb_tnIXeE3QXuB8PgIRWWfaQ") ??
        [];
    isBusy(false);
  }

  void isBusy(bool x) {
    if (x != busy) {
      busy = x;
      notifyListeners();
    }
  }
}
