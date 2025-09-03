import 'package:bmi_calc/helper/constant.dart';
import 'package:bmi_calc/widgets/custom_calc_button.dart';
import 'package:bmi_calc/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double bmi;
  final String result;
  final String advice;
  const Result({
    super.key,
    required this.bmi,
    required this.advice,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Color(0xff24263B),
        centerTitle: true,
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 24,
        children: [
          // Head Text
          Container(
            margin: EdgeInsets.only(left: 16),
            child: Text(
              "Your Result",
              style: TextStyle(
                color: primaryColor,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Result Content
          Expanded(
            child: CustomCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "${bmi.toStringAsFixed(1)}",
                    style: TextStyle(fontSize: 64, fontWeight: FontWeight.w700),
                  ),
                  Text(advice, style: labelStyle, textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
          // Re-Cala Button
          CustomCalcButton(
            title: "Re - Calculate",
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
