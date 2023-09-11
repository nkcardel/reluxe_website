import 'package:flutter/material.dart';

const blueColor = Color(0xFF003366);

ButtonStyle filledButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.all(blueColor),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      side: const BorderSide(color: blueColor),
      borderRadius: BorderRadius.circular(8),
    )));

ButtonStyle whiteFilledButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.all(Colors.white),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(8),
    )));

ButtonStyle borderButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all(0),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Set the corner radius
    ),
  ),
  side: MaterialStateProperty.all<BorderSide>(
    const BorderSide(
      color: blueColor,
      width: 1.5,
    ),
  ),
);

ButtonStyle thinBorderButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all(0),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Set the corner radius
    ),
  ),
  side: MaterialStateProperty.all<BorderSide>(
    const BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  ),
);

ButtonStyle whiteBorderButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all(0),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5), // Set the corner radius
    ),
  ),
  side: MaterialStateProperty.all<BorderSide>(
    const BorderSide(
      color: Colors.white,
      width: 1.5,
    ),
  ),
);
