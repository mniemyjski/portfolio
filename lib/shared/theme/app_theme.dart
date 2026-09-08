import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppColors {
  static const background = Color(0xFF0D0D0F);
  static const surface = Color(0xFF16161A);
  static const surfaceElevated = Color(0xFF1E1E24);
  static const accent = Color(0xFF6C8EFF);
  static const textPrimary = Color(0xFFF2F2F5);
  static const textMuted = Color(0xFF9CA3AF);
  static const border = Color(0x1FFFFFFF);
}

abstract final class AppSpacing {
  static const xs = 8.0;
  static const sm = 16.0;
  static const md = 24.0;
  static const lg = 32.0;
  static const xl = 48.0;
}

abstract final class AppRadius {
  static const chip = 8.0;
  static const card = 12.0;
  static const image = 16.0;
}

abstract final class AppTheme {
  static ThemeData get dark {
    final bodyFont = GoogleFonts.interTextTheme(ThemeData.dark().textTheme);
    final headingFont = GoogleFonts.spaceGroteskTextTheme(bodyFont);

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.surface,
        primary: AppColors.accent,
        onPrimary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
      ),
      textTheme: headingFont.copyWith(
        displayLarge: headingFont.displayLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
        ),
        headlineMedium: headingFont.headlineMedium?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: headingFont.headlineSmall?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: headingFont.titleLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: bodyFont.bodyLarge?.copyWith(
          color: AppColors.textMuted,
          fontSize: 17,
          height: 1.5,
        ),
        bodyMedium: bodyFont.bodyMedium?.copyWith(
          color: AppColors.textMuted,
          fontSize: 15,
          height: 1.6,
        ),
        labelLarge: bodyFont.labelLarge?.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceElevated,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.card),
          side: const BorderSide(color: AppColors.border),
        ),
      ),
    );
  }

  static MarkdownStyleSheet markdownStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MarkdownStyleSheet(
      p: textTheme.bodyMedium?.copyWith(
        fontSize: 16,
        height: 1.6,
        color: AppColors.textMuted,
      ),
      strong: textTheme.bodyMedium?.copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
        fontSize: 16,
        height: 1.6,
      ),
      listBullet: textTheme.bodyMedium?.copyWith(
        fontSize: 16,
        height: 1.6,
        color: AppColors.textMuted,
      ),
      h1: textTheme.titleLarge,
      h2: textTheme.titleLarge?.copyWith(fontSize: 18),
      blockSpacing: AppSpacing.sm,
      listIndent: AppSpacing.sm,
    );
  }

  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.35),
          blurRadius: 24,
          offset: const Offset(0, 12),
        ),
      ];
}
