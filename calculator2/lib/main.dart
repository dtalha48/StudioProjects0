import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: CalculatorApp(),
  ));
}

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  // Controllers for text fields
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();

  // Variables to handle selected formula and the result
  int selectedFormula = 0;
  String result = '';
  String image = 'assets/formula1.png';

  // Functions for each formula (placeholders)
  double formula1(double a, double b) => a + b;
  double formula2(double a, double b) => a - b;
  double formula3(double a, double b) => a * b;

  // Function to calculate based on selected formula
  void calculate() {
    double num1 = double.tryParse(input1Controller.text) ?? 0.0;
    double num2 = double.tryParse(input2Controller.text) ?? 0.0;
    double calcResult = 0.0;

    if (selectedFormula == 0) {
      calcResult = formula1(num1, num2);
    } else if (selectedFormula == 1) {
      calcResult = formula2(num1, num2);
    } else if (selectedFormula == 2) {
      calcResult = formula3(num1, num2);
    }

    setState(() {
      result = 'Result: $calcResult';
    });
  }

  // Function to update the image and formula based on selection
  void updateFormula(int formula) {
    setState(() {
      selectedFormula = formula;
      switch (formula) {
        case 0:
          image = 'assets/formula1.png';
          break;
        case 1:
          image = 'assets/formula2.png';
          break;
        case 2:
          image = 'assets/formula3.png';
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input 1 with label
            const Text('Input 1'),
            TextField(
              controller: input1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Input 2 with label
            const Text('Input 2'),
            TextField(
              controller: input2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Formula selection with radio buttons
            const Text('Select a Formula'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: selectedFormula,
                  onChanged: (value) => updateFormula(value as int),
                ),
                const Text('Formula 1'),
                Radio(
                  value: 1,
                  groupValue: selectedFormula,
                  onChanged: (value) => updateFormula(value as int),
                ),
                const Text('Formula 2'),
                Radio(
                  value: 2,
                  groupValue: selectedFormula,
                  onChanged: (value) => updateFormula(value as int),
                ),
                const Text('Formula 3'),
              ],
            ),
            const SizedBox(height: 20),

            // Image corresponding to selected formula
            Image.asset(image, height: 150),
            const SizedBox(height: 20),

            // Calculate button
            ElevatedButton(
              onPressed: calculate,
              child: const Text('Calculate'),
            ),

            // Result display
            Text(
              result,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
