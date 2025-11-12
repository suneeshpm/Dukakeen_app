import 'package:flutter/material.dart';

class AppColors {
  // ===== Primary Brand Colors =====
  static const Color primaryBlue = Color(0xFF1E88E5);
  static const Color darkBlue = Color(0xFF1A3D8A);
  static const Color accentBlue = Color(0xFF2E6EB5);

  // ===== Light Theme =====
  static const Color primaryLight = primaryBlue;
  static const Color backgroundLight = Color(0xFFF7F9FC);
  static const Color textLight = Colors.white;
  static const Color secondaryTextLight = Colors.white70;
  static const Color cardLight = Colors.white;
  static const Color borderLight = Color(0xFFE0E6ED);

  // ===== Dark Theme =====
  static const Color primaryDark = darkBlue;
  static const Color backgroundDark = Color(0xFF0F244A);
  static const Color textDark = Color(0xFFF2F6FF);
  static const Color secondaryTextDark = Color(0xFFB8C3E2);
  static const Color cardDark = Color(0xFF1B2E5A);
  static const Color borderDark = Color(0xFF2E467A);

  // ===== Status & Accent Colors =====
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningYellow = Color(0xFFFFC107);
  static const Color errorRed = Color(0xFFE53935);
  static const Color saleRed = Color(0xFFFF4B5C);
  static const Color offerOrange = Color(0xFFFF7043);
  static const Color infoBlue = Color(0xFF64B5F6);

  // ===== Neutral Shades =====
  static const Color greyLight = Color(0xFFCFD8DC);
  static const Color greyMedium = Color(0xFF90A4AE);
  static const Color greyDark = Color(0xFF455A64);

  // ===== Gradients =====
  static const LinearGradient splashGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryBlue, darkBlue],
  );

  static const LinearGradient splashGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0D1B3B), Color(0xFF122C5A)],
  );

  static const LinearGradient buttonGradientLight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primaryBlue, accentBlue],
  );

  static const LinearGradient buttonGradientDark = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1A3D8A), Color(0xFF244E9A)],
  );

  static const LinearGradient saleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF5F6D), Color(0xFFFFC371)],
  );

  static const LinearGradient dealGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2196F3), Color(0xFF64B5F6)],
  );

  static const LinearGradient newArrivalGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF66BB6A), Color(0xFF43A047)],
  );

  // ===== Helper Methods =====
  static Color withOpacity(Color color, double opacity) =>
      color.withOpacity(opacity);

  static LinearGradient getSplashGradient(Brightness brightness) =>
      brightness == Brightness.dark ? splashGradientDark : splashGradientLight;

  static LinearGradient getButtonGradient(Brightness brightness) =>
      brightness == Brightness.dark ? buttonGradientDark : buttonGradientLight;
  static const LinearGradient dealsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF3A7BD5), // soft blue
      Color(0xFF00D2FF), // light aqua
    ],
  );

  static const LinearGradient flashSaleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFFFF5858), // bright red
      Color(0xFFFFA858), // warm orange
    ],
  );

  static const LinearGradient couponsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF00C853), // vibrant green
      Color(0xFFB2FF59), // light lime
    ],
  );

  static const LinearGradient brandsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF8E2DE2), // purple
      Color(0xFF4A00E0), // deep violet
    ],
  );
}
