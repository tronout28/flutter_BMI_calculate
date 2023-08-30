import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class BMIController extends GetxController {
   final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  RxDouble bmi = 0.0.obs;
  RxBool hasCalculated = false.obs;
  RxString resultText = ''.obs;

  void calculateBMI(double weight, double height) {
 if (height > 0) {
      bmi.value = weight / (height * height);
      hasCalculated.value = true;
      setResultText();
    }
  }

  void resetBMI() {
    weightController.text = "";
    heightController.text = "";
    bmi.value = 0;
    hasCalculated.value = false;
    resultText.value = '';
  }

  void setResultText() {
    if (bmi.value >= 18.5 && bmi.value <= 25) {
      resultText.value = 'Ideal';
    } else if (bmi.value < 18.5) {
      resultText.value = 'Kurus';
    } else {
      resultText.value = 'Obesitas';
    }
  }
}

