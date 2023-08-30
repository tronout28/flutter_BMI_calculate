import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi_controller.dart';

class Home extends StatelessWidget {
  final BMIController _bmiController = Get.put(BMIController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengukur BMI"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text(
              "Keterangan:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Berat badan ideal adalah 18.5 - 25 kg/m².",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Kurus: < 18.5 kg/m².",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              "Obesitas: > 25 kg/m².",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _bmiController.weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat (kg)',
                hintText: 'Masukkan Berat Badan Anda',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _bmiController.heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi (m)',
                hintText: 'Masukkan Tinggi Badan Anda',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_bmiController.hasCalculated.isTrue) {
                  _bmiController.resetBMI();
                } else {
                  _bmiController.calculateBMI(
                    double.tryParse(_bmiController.weightController.text) ?? 0,
                    double.tryParse(_bmiController.heightController.text) ?? 0,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 41, 42, 43),
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Obx(() => Text(
                _bmiController.hasCalculated.isTrue ? "Reset" : "Hitung",
              )),
            ),
            SizedBox(height: 20),
            Obx(() => _bmiController.hasCalculated.isTrue
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Hasil perhitungan BMI:",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _bmiController.bmi.value.toStringAsFixed(2),
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Anda termasuk orang yang:",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8),
                      Text(
                        _bmiController.resultText.value,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _bmiController.bmi.value >= 18.5 &&
                                  _bmiController.bmi.value <= 25
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                    ],
                  )
                : Container()),
          ],
        ),
      ),
    );
  }
}
