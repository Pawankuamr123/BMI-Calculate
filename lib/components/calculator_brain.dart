import 'dart:math';

import '../main.dart';
class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'overeight';
    }
    else if (_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a heigher then normal body weight. Try to exercise more.';
    }
    else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    }
    else {
      return 'you have a lower then normal body weight.You can eat a bit more.';
    }
  }
}
