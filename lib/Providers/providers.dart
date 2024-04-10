import 'package:flutter/material.dart';

class StringData extends ChangeNotifier {
  String _data = '';
  double _calories = 0.0;

  String get data => _data;

  double get calories => _calories;

  void updateData(String newData) {
    _data = newData;
    notifyListeners();
  }

  void updateCalories(double newCalorie) {
    _calories = newCalorie;
    notifyListeners();
  }
}
