import 'package:bmi_calc/helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomCounterButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const CustomCounterButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Color(0xff8B8C9E),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: FaIcon(icon, color: primaryColor, size: 20),
      ),
    );
  }
}
