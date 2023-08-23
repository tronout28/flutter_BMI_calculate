import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmi = 0;
  bool hasCalculated = false;

  @override
  void initState() {
    super.initState();
    weightController = TextEditingController();
    heightController = TextEditingController();
  }

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    if (height > 0) {
      bmi = weight / (height * height);
      hasCalculated = true;
      setState(() {});
    }
  }

  void resetBMI() {
    weightController.text = "";
    heightController.text = "";
    bmi = 0;
    hasCalculated = false;
    setState(() {});
  }

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
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Berat (kg)',
                hintText: 'Masukkan Berat Badan Anda',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi (m)',
                hintText: 'Masukkan Tinggi Badan Anda',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hasCalculated ? resetBMI : calculateBMI,
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 41, 42, 43),
                textStyle: TextStyle(fontSize: 18),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(hasCalculated ? "Reset" : "Hitung"),
            ),
            SizedBox(height: 20),
            if (hasCalculated)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hasil perhitungan BMI:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Anda termasuk orang yang:",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 8),
                  Text(
                    bmi >= 18.5 && bmi <= 25
                        ? "Ideal"
                        : bmi < 18.5
                            ? "Kurus"
                            : "Obesitas",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: bmi >= 18.5 && bmi <= 25
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
