import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/app_style.dart';

class AppColorPalette {
  const AppColorPalette({
    required this.background,
    required this.surface,
    required this.surfaceContainer,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.outline,
    required this.textPrimary,
    required this.textSecondary,
    required this.eventDot,
    required this.lunarText,
    required this.specialDayBadge,
    required this.heroOverlayStart,
    required this.heroOverlayEnd,
  });

  final Color background;
  final Color surface;
  final Color surfaceContainer;
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color outline;
  final Color textPrimary;
  final Color textSecondary;
  final Color eventDot;
  final Color lunarText;
  final Color specialDayBadge;
  final Color heroOverlayStart;
  final Color heroOverlayEnd;
}

const darkImperialPalette = AppColorPalette(
  background: Color(0xFF0F1115),
  surface: Color(0xFF1A1E24),
  surfaceContainer: Color(0xFF232833),
  primary: Color(0xFFC8A45C),
  secondary: Color(0xFF8B1E2D),
  tertiary: Color(0xFFB7862E),
  outline: Color(0xFF2F3440),
  textPrimary: Color(0xFFF2F2F2),
  textSecondary: Color(0xFFA6AAB3),
  eventDot: Color(0xFF8B1E2D),
  lunarText: Color(0xFFC8A45C),
  specialDayBadge: Color(0xFFB7862E),
  heroOverlayStart: Color(0x99000000),
  heroOverlayEnd: Color(0x33000000),
);

const darkJadePalette = AppColorPalette(
  background: Color(0xFF0E1512),
  surface: Color(0xFF16201B),
  surfaceContainer: Color(0xFF1E2A23),
  primary: Color(0xFF2E6F5E),
  secondary: Color(0xFFC9A86A),
  tertiary: Color(0xFF5B8F7D),
  outline: Color(0xFF2D3B34),
  textPrimary: Color(0xFFEDEFEA),
  textSecondary: Color(0xFF9FA7A1),
  eventDot: Color(0xFFC9A86A),
  lunarText: Color(0xFFC9A86A),
  specialDayBadge: Color(0xFF2E6F5E),
  heroOverlayStart: Color(0x99000000),
  heroOverlayEnd: Color(0x33000000),
);

const darkScholarPalette = AppColorPalette(
  background: Color(0xFF121316),
  surface: Color(0xFF1A1C21),
  surfaceContainer: Color(0xFF242730),
  primary: Color(0xFF4F6EF7),
  secondary: Color(0xFFE6B450),
  tertiary: Color(0xFF7C92FF),
  outline: Color(0xFF303540),
  textPrimary: Color(0xFFF1F2F4),
  textSecondary: Color(0xFF9DA3AE),
  eventDot: Color(0xFFE6B450),
  lunarText: Color(0xFFE6B450),
  specialDayBadge: Color(0xFF4F6EF7),
  heroOverlayStart: Color(0x99000000),
  heroOverlayEnd: Color(0x33000000),
);

const ancientBronzePalette = AppColorPalette(
  background: Color(0xFF14120F),
  surface: Color(0xFF1E1A15),
  surfaceContainer: Color(0xFF27221B),
  primary: Color(0xFFB08D57),
  secondary: Color(0xFF7A4B2A),
  tertiary: Color(0xFFC9A86A),
  outline: Color(0xFF332A22),
  textPrimary: Color(0xFFECE6DD),
  textSecondary: Color(0xFFB3A99C),
  eventDot: Color(0xFF7A4B2A),
  lunarText: Color(0xFFB08D57),
  specialDayBadge: Color(0xFFC9A86A),
  heroOverlayStart: Color(0x99000000),
  heroOverlayEnd: Color(0x33000000),
);

const darkCrimsonPalette = AppColorPalette(
  background: Color(0xFF130E10),
  surface: Color(0xFF1C1518),
  surfaceContainer: Color(0xFF261E21),
  primary: Color(0xFFA02C3A),
  secondary: Color(0xFFD4A373),
  tertiary: Color(0xFFB24A56),
  outline: Color(0xFF34262A),
  textPrimary: Color(0xFFF5EFEA),
  textSecondary: Color(0xFFB9AFA9),
  eventDot: Color(0xFFA02C3A),
  lunarText: Color(0xFFD4A373),
  specialDayBadge: Color(0xFFD4A373),
  heroOverlayStart: Color(0x99000000),
  heroOverlayEnd: Color(0x33000000),
);

const midnightBluePalette = AppColorPalette(
  background: Color(0xFF0C111A),
  surface: Color(0xFF151B26),
  surfaceContainer: Color(0xFF1F2736),
  primary: Color(0xFF3E5CFF),
  secondary: Color(0xFFE6B450),
  tertiary: Color(0xFF6E86FF),
  outline: Color(0xFF2A3242),
  textPrimary: Color(0xFFF2F4F8),
  textSecondary: Color(0xFF9CA3AF),
  eventDot: Color(0xFFE6B450),
  lunarText: Color(0xFFE6B450),
  specialDayBadge: Color(0xFF3E5CFF),
  heroOverlayStart: Color(0x99000000),
  heroOverlayEnd: Color(0x33000000),
);

const obsidianGoldPalette = AppColorPalette(
  background: Color(0xFF0B0B0C),
  surface: Color(0xFF151516),
  surfaceContainer: Color(0xFF1F1F20),
  primary: Color(0xFFD4AF37),
  secondary: Color(0xFF7A1F2B),
  tertiary: Color(0xFFE2C75B),
  outline: Color(0xFF27272A),
  textPrimary: Color(0xFFF4F4F5),
  textSecondary: Color(0xFFA1A1AA),
  eventDot: Color(0xFF7A1F2B),
  lunarText: Color(0xFFD4AF37),
  specialDayBadge: Color(0xFFE2C75B),
  heroOverlayStart: Color(0x99000000),
  heroOverlayEnd: Color(0x33000000),
);

const deepForestPalette = AppColorPalette(
  background: Color(0xFF0D1410),
  surface: Color(0xFF162019),
  surfaceContainer: Color(0xFF1E2A21),
  primary: Color(0xFF2F7A4A),
  secondary: Color(0xFFC7A86C),
  tertiary: Color(0xFF4F9F6B),
  outline: Color(0xFF2B3A31),
  textPrimary: Color(0xFFECF0EB),
  textSecondary: Color(0xFF9DA8A0),
  eventDot: Color(0xFFC7A86C),
  lunarText: Color(0xFFC7A86C),
  specialDayBadge: Color(0xFF2F7A4A),
  heroOverlayStart: Color(0x99000000),
  heroOverlayEnd: Color(0x33000000),
);

AppColorPalette paletteForStyle(AppStyle style) {
  return switch (style) {
    AppStyle.darkImperial => darkImperialPalette,
    AppStyle.darkJade => darkJadePalette,
    AppStyle.darkScholar => darkScholarPalette,
    AppStyle.ancientBronze => ancientBronzePalette,
    AppStyle.darkCrimson => darkCrimsonPalette,
    AppStyle.midnightBlue => midnightBluePalette,
    AppStyle.obsidianGold => obsidianGoldPalette,
    AppStyle.deepForest => deepForestPalette,
  };
}
