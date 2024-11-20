import 'package:drink_ordering_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData mainThemeData = ThemeData(
  colorScheme: mainColorScheme,
  textTheme: mainTextTheme,
  useMaterial3: true,
);

ColorScheme mainColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors.grey5050,
  primary: AppColors.grey5050,
  onPrimary: AppColors.whiteEEF1,
  surface: AppColors.grey9999,
  secondary: AppColors.grey3333,
  onSecondary: AppColors.orangeF5A6,
  onSurface: AppColors.whiteEEF1,
  brightness: Brightness.dark,
  onTertiary: AppColors.orangeFFCC,
  onSecondaryFixed: AppColors.orangeFFAE,
);

TextTheme mainTextTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontSize: 36,
    color: AppColors.whiteEEF1,
    fontWeight: FontWeight.w600,
  ),
  headlineMedium: TextStyle(
    color: AppColors.whiteEEF1,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  ),
  headlineSmall: TextStyle(
    color: AppColors.grey9999,
    fontSize: 14,
  ),
  titleMedium: TextStyle(
    color: AppColors.grey9999,
    fontSize: 16,
  ),
  titleSmall: TextStyle(
    fontSize: 14,
    color: AppColors.grey9999,
    fontWeight: FontWeight.bold,
  ),
  labelMedium: TextStyle(
    color: AppColors.whiteEEF1,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  ),
  labelSmall: TextStyle(
    color: AppColors.whiteEEF1,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
  bodyMedium: TextStyle(
    color: AppColors.whiteEEF1,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
  bodySmall: TextStyle(
    color: AppColors.whiteEEF1,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  ),
  displayMedium: TextStyle(
    color: AppColors.orangeFFCC,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  ),
  displayLarge: TextStyle(
    color: AppColors.whiteEEF1,
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
  displaySmall: TextStyle(
    color: AppColors.whiteEEF1,
    fontSize: 13,
    fontWeight: FontWeight.w300,
  ),
);
