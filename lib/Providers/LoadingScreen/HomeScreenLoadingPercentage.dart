import 'package:flutter/cupertino.dart';

class Percentage extends ChangeNotifier {
  double percentage = 0.5;
  void updatePercentage(double updatedPercentage) {
    percentage = updatedPercentage;
    notifyListeners();
  }

  double getPercentage() {
    return percentage;
  }
}
