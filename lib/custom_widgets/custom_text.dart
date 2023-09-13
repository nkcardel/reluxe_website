// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BodyText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color textColor;
  final FontWeight fontWeight;
  final double letterSpacing;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  const BodyText({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
    this.textAlign = TextAlign.justify,
    this.textDecoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        decoration: textDecoration,
        fontSize: fontSize,
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
  final TextAlign textAlign;
  const Heading1({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
    this.textAlign = TextAlign.justify,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
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
  final TextAlign textAlign;
  const Heading2({
    super.key,
    required this.text,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
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
  final TextAlign textAlign;
  const Heading3(
      {super.key,
      required this.text,
      this.textColor = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.letterSpacing = 0,
      this.textAlign = TextAlign.start});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 20,
        fontWeight: fontWeight,
        color: textColor,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
