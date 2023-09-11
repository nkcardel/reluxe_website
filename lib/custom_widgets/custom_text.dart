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
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 15,
        fontWeight: fontWeight,
        color: textColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class Heading1 extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;
  const Heading1(
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
        fontSize: 40,
        fontWeight: fontWeight,
        color: textColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class Heading2 extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;
  const Heading2(
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
        fontSize: 30,
        fontWeight: fontWeight,
        color: textColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class Heading3 extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;
  const Heading3(
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
        fontSize: 20,
        fontWeight: fontWeight,
        color: textColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
