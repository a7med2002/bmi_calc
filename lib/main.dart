import 'package:bmi_calc/helper/constant.dart';
import 'package:bmi_calc/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(primaryColor: primaryColor),
      title: 'BMI Calc',
      home: Home(),
    );
  }
}
