import 'package:flutter/material.dart';
import 'package:mtg_picker/ui/resurces/app_colors.dart';

final themeData = ThemeData(
  primaryColor: AppColors.orange,
  scaffoldBackgroundColor: AppColors.brown_1,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.brown_0,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      color: AppColors.white,
      fontSize: 10,
      fontFamily: 'serif',
      fontWeight: FontWeight.w500,
      height: 1.60,
      letterSpacing: 1.50,
    ),
    titleSmall: TextStyle(
      color: AppColors.white,
      fontSize: 10,
      fontFamily: 'serif',
      fontWeight: FontWeight.w500,
      height: 1.60,
      letterSpacing: 1.50,
    ),
    titleLarge: TextStyle(
        color: AppColors.white,
        fontSize: 16,
        fontFamily: 'serif',
        fontWeight: FontWeight.w500,
        height: 1.50,
        letterSpacing: 0.50),
    titleMedium: TextStyle(
        color: AppColors.white,
        fontSize: 12,
        fontFamily: 'serif',
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.50),
  ),
);
