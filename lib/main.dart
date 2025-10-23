import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/bmi_calculator_screen.dart';
import 'models/bmi_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => BMIModel(), child: const BMICalculatorApp()),
  );
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BMICalculatorScreen(),
    );
  }
}