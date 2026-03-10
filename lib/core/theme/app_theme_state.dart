import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/app_style.dart';

class AppThemeState {
  final AppStyle style;
  final ThemeData theme;

  const AppThemeState({required this.style, required this.theme});

  AppThemeState copyWith({AppStyle? style, ThemeData? theme}) {
    return AppThemeState(
      style: style ?? this.style,
      theme: theme ?? this.theme,
    );
  }
}
