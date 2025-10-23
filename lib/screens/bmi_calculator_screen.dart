import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/bmi_model.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI Calculator')), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                Provider.of<BMIModel>(context, listen: false).weight = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                Provider.of<BMIModel>(context, listen: false).height = double.tryParse(value) ?? 0.0;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Provider.of<BMIModel>(context, listen: false).calculateBMI();
              },
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(height: 20),
            Consumer<BMIModel>(
              builder: (context, bmiModel, child) {
                return Text(
                  'BMI: ${bmiModel.bmi.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            Consumer<BMIModel>(
              builder: (context, bmiModel, child) {
                return Text(
                  'Category: ${bmiModel.category}',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}