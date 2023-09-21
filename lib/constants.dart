import 'package:flutter/material.dart';

const blueColor = Color(0xFF003366);
const goldColor = Color(0xFFB8860B);

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

ButtonStyle fadedWhiteFilledButtonStyle = ButtonStyle(
    elevation: MaterialStateProperty.all(0),
    backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.8)),
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
      borderRadius: BorderRadius.circular(8), // Set the corner radius
    ),
  ),
  side: MaterialStateProperty.all<BorderSide>(
    const BorderSide(
      color: Colors.white,
      width: 1.5,
    ),
  ),
);

ButtonStyle blackBorderButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all(0),
  backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0), // Set the corner radius
    ),
  ),
  side: MaterialStateProperty.all<BorderSide>(
    const BorderSide(
      color: Colors.black,
      width: 1.5,
    ),
  ),
);

TextStyle bodyTextStyle = const TextStyle(
  fontSize: 15,
  color: Colors.black,
);
