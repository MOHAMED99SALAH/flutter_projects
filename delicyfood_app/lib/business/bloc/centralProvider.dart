import 'package:flutter/material.dart';

class TotalPrice with ChangeNotifier {
  double num;

  TotalPrice(this.num);

  decremnt(double amount) {
    num = num - amount;
    notifyListeners();
  }

  icremnt(double amount) {
    num = num + amount;
    notifyListeners();
  }
}
