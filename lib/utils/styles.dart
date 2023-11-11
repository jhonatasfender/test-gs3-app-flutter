import 'package:flutter/material.dart';

class AppStyles {
  static TextStyle buildTextStyle(
    double fontSize,
    FontWeight fontWeight, {
    Color color = Colors.white,
  }) {
    return TextStyle(
      fontFamily: 'Mulish',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle cardTitleStyle = const TextStyle(
    fontFamily: 'Mulish',
    fontSize: 14.0,
    color: Colors.white,
  );

  static TextStyle cardSubtitleStyle = const TextStyle(
    fontFamily: 'Mulish',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle lastReleasesTitleStyle = const TextStyle(
    color: Color(0xFF1a1a1a),
    fontFamily: 'Mulish',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle lastReleasesDateStyle = const TextStyle(
    color: Color(0xFF2890cf),
    fontFamily: 'Mulish',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle lastReleasesAmountStyle = const TextStyle(
    color: Color(0xFF212121),
    fontFamily: 'Mulish',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  static TextStyle lastReleasesAmountDetailsStyle = const TextStyle(
    color: Color(0xFF828285),
    fontFamily: 'Mulish',
    fontSize: 12.0,
    fontWeight: FontWeight.bold,
  );
}
