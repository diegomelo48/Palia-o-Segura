import 'package:flutter/material.dart';

/// Paleta de cores do app — a mesma padronizada na versão Android nativa
/// (res/values/colors.xml), mantendo o azul petróleo e o verde já usados.
class AppColors {
  AppColors._();

  // Marca
  static const primary = Color(0xFF1E4E68);
  static const primaryDark = Color(0xFF163B4F);
  static const primaryVariant = Color(0xFF2F6E8C);
  static const primaryLight = Color(0xFFDCE7EC);

  static const secondary = Color(0xFF3CB371);
  static const secondaryDark = Color(0xFF2E8B57);
  static const secondaryLight = Color(0xFFE1F5EA);

  // Superfícies
  static const background = Color(0xFFF7F9FA);
  static const surface = Color(0xFFFFFFFF);
  static const divider = Color(0xFFE3E7E9);

  // Texto
  static const textPrimary = Color(0xFF1C1C1C);
  static const textSecondary = Color(0xFF5F6B72);
  static const textHint = Color(0xFF98A2A8);
  static const textOnPrimary = Color(0xFFFFFFFF);

  // Estado
  static const error = Color(0xFFD9534F);
  static const warning = Color(0xFFF2A93B);

  // Paleta de destaque dos cards da Home (tons da família azul/verde)
  static const accent1 = primary;
  static const accent1Tint = Color(0xFFE4ECF0);

  static const accent2 = secondary;
  static const accent2Tint = secondaryLight;

  static const accent3 = Color(0xFF2F6E8C);
  static const accent3Tint = Color(0xFFE6EEF2);

  static const accent4 = Color(0xFF2E8B57);
  static const accent4Tint = Color(0xFFE4F3EA);

  static const accent5 = Color(0xFF4C8C7D);
  static const accent5Tint = Color(0xFFE5F0ED);
}

/// Espaçamentos e raios padronizados — equivalente ao dimens.xml.
class AppSpacing {
  AppSpacing._();

  static const xs = 4.0;
  static const sm = 8.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;

  static const radiusCard = 14.0;
  static const radiusInput = 10.0;
  static const radiusButton = 28.0;

  static const inputHeight = 56.0;
  static const cardHomeHeight = 104.0;
  static const badgeSize = 48.0;
  static const iconSize = 26.0;
}

/// ThemeData central do app, equivalente ao styles.xml.
class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        error: AppColors.error,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Roboto',
    );

    return base.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        elevation: 4,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: AppColors.textOnPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      textTheme: base.textTheme.copyWith(
        headlineSmall: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
        titleMedium: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        bodyMedium: const TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
        ),
        bodySmall: const TextStyle(
          fontSize: 13,
          color: AppColors.textSecondary,
        ),
        labelLarge: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textOnPrimary,
          minimumSize: const Size.fromHeight(56),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusButton),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: const BorderSide(color: AppColors.primary),
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.radiusButton),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        hintStyle: const TextStyle(color: AppColors.textHint),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusInput),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusInput),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusInput),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusInput),
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
