import 'package:flutter/material.dart';

final class AppColors {
  static const white = Color(0xFFFFFFFF);
  static const grey5050 = Color(0xFF505050);
  static const grey3333 = Color(0xFF333333);
  static const grey585 = Color(0xFF585454);
  static const grey9999 = Color(0xFF999999);
  static const orangeF5A6 = Color(0xFFF5A623);
  static const orangeFFCC = Color(0xFFFFCC49);
  static const whiteEEF1 = Color(0xFFEEF1F5);
  static const orangeFFAE = Color(0xFFFFAE00);
  static const greenDark = Color(0xFF3E6B00);
  static const greenLight = Color(0xFF6AD200);
}

final class AppGradients {
  static Gradient greyMainGradient = LinearGradient(
    colors: [
      AppColors.grey3333.withOpacity(0.01),
      AppColors.grey3333,
    ],
    stops: const [0, 0.45],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
