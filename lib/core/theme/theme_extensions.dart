import 'package:flutter/material.dart';

@immutable
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  const AppColorExtension({
    required this.textPrimary,
    required this.textSecondary,
    required this.eventDot,
    required this.lunarText,
    required this.specialDayBadge,
    required this.heroOverlayStart,
    required this.heroOverlayEnd,
  });

  final Color textPrimary;
  final Color textSecondary;
  final Color eventDot;
  final Color lunarText;
  final Color specialDayBadge;
  final Color heroOverlayStart;
  final Color heroOverlayEnd;

  @override
  AppColorExtension copyWith({
    Color? textPrimary,
    Color? textSecondary,
    Color? eventDot,
    Color? lunarText,
    Color? specialDayBadge,
    Color? heroOverlayStart,
    Color? heroOverlayEnd,
  }) {
    return AppColorExtension(
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      eventDot: eventDot ?? this.eventDot,
      lunarText: lunarText ?? this.lunarText,
      specialDayBadge: specialDayBadge ?? this.specialDayBadge,
      heroOverlayStart: heroOverlayStart ?? this.heroOverlayStart,
      heroOverlayEnd: heroOverlayEnd ?? this.heroOverlayEnd,
    );
  }

  @override
  AppColorExtension lerp(ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) return this;
    return AppColorExtension(
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textSecondary:
          Color.lerp(textSecondary, other.textSecondary, t) ?? textSecondary,
      eventDot: Color.lerp(eventDot, other.eventDot, t) ?? eventDot,
      lunarText: Color.lerp(lunarText, other.lunarText, t) ?? lunarText,
      specialDayBadge:
          Color.lerp(specialDayBadge, other.specialDayBadge, t) ??
          specialDayBadge,
      heroOverlayStart:
          Color.lerp(heroOverlayStart, other.heroOverlayStart, t) ??
          heroOverlayStart,
      heroOverlayEnd:
          Color.lerp(heroOverlayEnd, other.heroOverlayEnd, t) ?? heroOverlayEnd,
    );
  }
}

@immutable
class AppSpacingExtension extends ThemeExtension<AppSpacingExtension> {
  const AppSpacingExtension({
    required this.xxs,
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  final double xxs;
  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  @override
  AppSpacingExtension copyWith({
    double? xxs,
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return AppSpacingExtension(
      xxs: xxs ?? this.xxs,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  @override
  AppSpacingExtension lerp(
    ThemeExtension<AppSpacingExtension>? other,
    double t,
  ) {
    if (other is! AppSpacingExtension) return this;
    return AppSpacingExtension(
      xxs: _lerpDouble(xxs, other.xxs, t),
      xs: _lerpDouble(xs, other.xs, t),
      sm: _lerpDouble(sm, other.sm, t),
      md: _lerpDouble(md, other.md, t),
      lg: _lerpDouble(lg, other.lg, t),
      xl: _lerpDouble(xl, other.xl, t),
      xxl: _lerpDouble(xxl, other.xxl, t),
    );
  }
}

@immutable
class AppRadiusExtension extends ThemeExtension<AppRadiusExtension> {
  const AppRadiusExtension({
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.xxl,
  });

  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double xxl;

  @override
  AppRadiusExtension copyWith({
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? xxl,
  }) {
    return AppRadiusExtension(
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  @override
  AppRadiusExtension lerp(ThemeExtension<AppRadiusExtension>? other, double t) {
    if (other is! AppRadiusExtension) return this;
    return AppRadiusExtension(
      sm: _lerpDouble(sm, other.sm, t),
      md: _lerpDouble(md, other.md, t),
      lg: _lerpDouble(lg, other.lg, t),
      xl: _lerpDouble(xl, other.xl, t),
      xxl: _lerpDouble(xxl, other.xxl, t),
    );
  }
}

extension ThemeContextX on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  AppColorExtension get appColors =>
      theme.extension<AppColorExtension>() ??
      const AppColorExtension(
        textPrimary: Colors.white,
        textSecondary: Colors.white70,
        eventDot: Colors.red,
        lunarText: Colors.amber,
        specialDayBadge: Colors.blue,
        heroOverlayStart: Color(0x99000000),
        heroOverlayEnd: Color(0x33000000),
      );

  AppSpacingExtension get appSpacing =>
      theme.extension<AppSpacingExtension>() ??
      const AppSpacingExtension(
        xxs: 4,
        xs: 8,
        sm: 12,
        md: 16,
        lg: 24,
        xl: 32,
        xxl: 40,
      );

  AppRadiusExtension get appRadius =>
      theme.extension<AppRadiusExtension>() ??
      const AppRadiusExtension(sm: 8, md: 12, lg: 16, xl: 20, xxl: 28);
}

double _lerpDouble(double a, double b, double t) => a + (b - a) * t;
