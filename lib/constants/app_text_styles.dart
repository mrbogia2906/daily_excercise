import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles._();
  static const TextStyle header = TextStyle(
    color: Color(0xFF222A44),
    fontSize: 28,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeight.w900,
    height: 0,
    letterSpacing: 0.8,
  );

  static const TextStyle searchHint = TextStyle(
    color: Color.fromARGB(255, 209, 209, 209),
    fontSize: 16,
  );

  static const TextStyle exerciseTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: Color.fromARGB(255, 73, 73, 73),
  );

  static const TextStyle meditationHeader = TextStyle(
    color: Color(0xFF222A44),
    fontSize: 28,
    fontFamily: 'Proxima Nova',
    fontWeight: FontWeight.w900,
    height: 2,
    letterSpacing: 0.8,
  );

  static const TextStyle meditationSubtitle = TextStyle(
    color: Color(0xFF38415C),
    fontSize: 14,
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.w700,
    height: 1,
    letterSpacing: 0.13,
  );

  static const TextStyle meditationDescription = TextStyle(
    color: Color(0xFF121F44),
    fontSize: 12,
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.w500,
    height: 1.5,
    letterSpacing: 0.43,
  );

  static const TextStyle meditationSectionTitle = TextStyle(
    fontWeight: FontWeight.w700,
  );

  static const TextStyle meditationBasicsTitle = TextStyle(
    color: Color(0xFF38415C),
    fontSize: 17,
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.w700,
    height: 0,
    letterSpacing: 0.16,
  );

  static const TextStyle meditationBasicsSubtitle = TextStyle(
    color: Color(0xFF38415C),
    fontSize: 13,
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.w500,
    height: 0,
    letterSpacing: 0.16,
  );
}
