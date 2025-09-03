import 'package:bmi_calc/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomGender extends StatelessWidget {
  final String gender;
  final IconData icon;

  const CustomGender({super.key, required this.gender, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FaIcon(icon, color: primaryColor, size: 90),
        Text(gender, style: labelStyle),
      ],
    );
  }
}
