import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color roseMauve = Color(0xFFC26A82);
  static const Color roseMauveOverlay = Color(0x96C26A82);

  static const Color warmBrown = Color(0xFF735138);

  static const Color deepCrimson = Color(0xFF933952);

  static const Color darkWine = Color(0xFF4B2A2B);

  static const Color blushPink = Color(0xFFFFD5D7);

  static const Color scaffoldBg = Color(0xFF3A1A1C);
  static const Color cardBg = Color(0x40C26A82); // roseMauve 25%
  static const Color inputBg = Color(0x30C26A82);
  static const Color buttonBg = Color(0xFF5C2F33);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xCCFFFFFF);
  static const Color textHint = Color(0x80FFFFFF);
  static const Color divider = Color(0x40FFFFFF);
  static const Color iconTint = Color(0xCCFFFFFF);

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF5C2030), Color(0xFF3A1A1C), Color(0xFF4B2A2B)],
    stops: [0.0, 0.5, 1.0],
  );
}

class AppTextStyles {
  static TextStyle displayLarge = GoogleFonts.playfairDisplay(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );

  static TextStyle headingLarge = GoogleFonts.playfairDisplay(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );

  static TextStyle headingMedium = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle bodySmall = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
  );

  static TextStyle buttonText = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );

  static TextStyle labelSmall = GoogleFonts.inter(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.5,
  );
}

/// ThemeData wiring
ThemeData buildAppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.scaffoldBg,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.deepCrimson,
      secondary: AppColors.roseMauve,
      surface: AppColors.darkWine,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBg,
      hintStyle: AppTextStyles.bodySmall,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.roseMauve.withOpacity(0.4)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.roseMauve.withOpacity(0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.roseMauve, width: 1.5),
      ),
    ),
    useMaterial3: true,
  );
}
