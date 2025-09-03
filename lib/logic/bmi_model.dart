import 'dart:math';

class BmiModel {
  final int weight;
  final int height;
  double bmi = 0;

  BmiModel({required this.weight, required this.height});

  double calcBmi() {
    bmi = weight / pow(height / 100, 2);
    return bmi;
  }

  String getResult() {
    if (bmi >= 40) {
      return "Obese";
    } else if (bmi >= 25) {
      return "Overweight";
    } else if (bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getAdvice() {
    if (bmi >= 40) {
      return "It's important to consult a doctor for a comprehensive health assessment.";
    } else if (bmi >= 25) {
      return "Try incorporating more physical activity and mindful eating into your routine.";
    } else if (bmi >= 18.5) {
      return "Keep up your healthy habits with balanced meals and regular exercise.";
    } else {
      return "Consider consulting a nutritionist to ensure you're getting enough nutrients.";
    }
  }
}