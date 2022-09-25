import 'package:cryptic_hunt/data/phase.dart';
import 'package:cryptic_hunt/networking/ApiService.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../data/question_group.dart';

class PhaseNotifier extends ChangeNotifier {
  bool busy = false;
  Phase? phase;
  late ApiService api;

  PhaseNotifier() {
    api = GetIt.I<ApiService>();
  }

  Future<void> getCurrentPhase() async {
    try {
      phase = await api.getCurrentPhase() ??
          Phase(-1, -1, " Tick! Tock!", "Ends In",
              DateTime(2022, 10, 2, 24).toIso8601String());
    } catch (e) {
      rethrow;
    }
  }

  Stream<Phase> phaseStream() async* {
    Phase? currentPhase = phase;
    print("LISTEN");
    while (true) {
      currentPhase = await api.getCurrentPhase() ??
          Phase(-1, -1, " Tick! Tock!", "Starts In",
              DateTime(2022, 10, 2, 24).toIso8601String());

      if (phase == null) {
        phase = currentPhase;
        yield phase!;
      } else if (currentPhase.changeTrigger != phase!.changeTrigger) {
        phase = currentPhase;
        yield phase!;
      }
      await Future.delayed(Duration(seconds: 10));
    }
  }

  void isBusy(bool x) {
    if (x != busy) {
      busy = x;
      notifyListeners();
    }
  }
}
