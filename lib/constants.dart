import 'package:flutter/material.dart';

const blueColor = Color(0xFF003366);

ButtonStyle filledButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.all(blueColor),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      side: const BorderSide(color: blueColor),
      borderRadius: BorderRadius.circular(5),
    )));