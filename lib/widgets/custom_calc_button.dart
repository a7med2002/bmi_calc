import 'package:bmi_calc/helper/constant.dart';
import 'package:flutter/material.dart';

class CustomCalcButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const CustomCalcButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        padding: EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(0),
        ),
      ),
      child: Text(title, style: TextStyle(color: primaryColor, fontSize: 32)),
    );
  }
}
