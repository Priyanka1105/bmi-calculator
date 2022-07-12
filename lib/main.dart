import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' :(context)=>InputPage(),
        '/result' : (context) => ResultPage(),

      },
      initialRoute: '/',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.cyan,
      )
    );
  }
}

