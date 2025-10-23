import 'package:flutter/material.dart';

class BMIModel extends ChangeNotifier {
  double _weight = 0.0;
  double _height = 0.0;
  double _bmi = 0.0;
  String _category = '';

  double get weight => _weight;
  set weight(double value) {
    _weight = value;
    notifyListeners();
  }

  double get height => _height;
  set height(double value) {
    _height = value;
    notifyListeners();
  }

  double get bmi => _bmi;

  String get category => _category;

  void calculateBMI() {
    if (_weight > 0 && _height > 0) {
      double heightInMeters = _height / 100;
      _bmi = _weight / (heightInMeters * heightInMeters);
      _category = getCategory(_bmi);
      notifyListeners();
    } else {
      _bmi = 0.0;
      _category = '';
      notifyListeners();
    }
  }

  String getCategory(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal weight';
    } else if (bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}