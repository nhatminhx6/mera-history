import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/app_style.dart';
import 'package:mera_history/core/theme/color_palettes.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/core/theme/theme_tokens.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData fromStyle(AppStyle style) {
    final palette = paletteForStyle(style);
    final textTheme = ThemeTokens.textTheme(palette);

    final colorScheme = const ColorScheme.dark().copyWith(
      primary: palette.primary,
      secondary: palette.secondary,
      tertiary: palette.tertiary,
      surface: palette.surface,
      onSurface: palette.textPrimary,
      outline: palette.outline,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: palette.background,
      textTheme: textTheme,
      cardTheme: CardThemeData(
        color: palette.surfaceContainer,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeTokens.radiusXl),
          side: BorderSide(color: palette.outline.withValues(alpha: 0.35)),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: palette.surface,
        elevation: 0,
        indicatorColor: palette.primary.withValues(alpha: 0.2),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? palette.primary : palette.textSecondary,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return textTheme.labelLarge?.copyWith(
            color: selected ? palette.textPrimary : palette.textSecondary,
          );
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: palette.surfaceContainer,
        hintStyle: textTheme.bodyMedium,
        prefixIconColor: palette.textSecondary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeTokens.radiusLg),
          borderSide: BorderSide(color: palette.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeTokens.radiusLg),
          borderSide: BorderSide(color: palette.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(ThemeTokens.radiusLg),
          borderSide: BorderSide(color: palette.primary, width: 1.2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: ThemeTokens.spacingMd,
          vertical: ThemeTokens.spacingSm,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: palette.surfaceContainer,
        selectedColor: palette.primary.withValues(alpha: 0.2),
        side: BorderSide(color: palette.outline),
        labelStyle: textTheme.bodySmall,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ThemeTokens.radiusMd),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: palette.primary,
          foregroundColor: palette.background,
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeTokens.spacingMd,
            vertical: ThemeTokens.spacingSm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeTokens.radiusLg),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: palette.textPrimary,
          side: BorderSide(color: palette.outline),
          textStyle: textTheme.labelLarge,
          padding: const EdgeInsets.symmetric(
            horizontal: ThemeTokens.spacingMd,
            vertical: ThemeTokens.spacingSm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ThemeTokens.radiusLg),
          ),
        ),
      ),
      extensions: [
        AppColorExtension(
          textPrimary: palette.textPrimary,
          textSecondary: palette.textSecondary,
          eventDot: palette.eventDot,
          lunarText: palette.lunarText,
          specialDayBadge: palette.specialDayBadge,
          heroOverlayStart: palette.heroOverlayStart,
          heroOverlayEnd: palette.heroOverlayEnd,
        ),
        const AppSpacingExtension(
          xxs: ThemeTokens.spacingXxs,
          xs: ThemeTokens.spacingXs,
          sm: ThemeTokens.spacingSm,
          md: ThemeTokens.spacingMd,
          lg: ThemeTokens.spacingLg,
          xl: ThemeTokens.spacingXl,
          xxl: ThemeTokens.spacingXxl,
        ),
        const AppRadiusExtension(
          sm: ThemeTokens.radiusSm,
          md: ThemeTokens.radiusMd,
          lg: ThemeTokens.radiusLg,
          xl: ThemeTokens.radiusXl,
          xxl: ThemeTokens.radiusXxl,
        ),
      ],
    );
  }
}
