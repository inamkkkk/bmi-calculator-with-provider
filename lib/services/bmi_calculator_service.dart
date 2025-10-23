class BMICalculatorService {
  double calculateBMI(double weight, double height) {
    if (weight > 0 && height > 0) {
      double heightInMeters = height / 100;
      return weight / (heightInMeters * heightInMeters);
    } else {
      return 0.0;
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