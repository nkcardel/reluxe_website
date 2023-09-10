// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;
  const BodyText(
      {super.key,
      required this.text,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.letterSpacing = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 17,
        fontWeight: fontWeight,
        color: textColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
