import 'package:dukakeen_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'typography.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      foregroundColor: Colors.white,
    ),
    cardColor: AppColors.cardLight,
    textTheme: const TextTheme(
      bodyLarge: AppTypography.body,
      bodyMedium: AppTypography.body,
      titleLarge: AppTypography.headline,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      foregroundColor: Colors.white,
    ),
    cardColor: AppColors.cardDark,
    textTheme: const TextTheme(
      bodyLarge: AppTypography.body,

      bodyMedium: AppTypography.body,
      titleLarge: AppTypography.headline,
    ),
  );
}
