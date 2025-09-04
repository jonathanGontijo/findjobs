import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text, {super.key, this.fontSize = 14});
  final String text;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: fontSize));
  }
}
