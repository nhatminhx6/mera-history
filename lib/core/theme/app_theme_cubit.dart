import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/theme/app_style.dart';
import 'package:mera_history/core/theme/app_theme.dart';
import 'package:mera_history/core/theme/app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit()
    : super(
        AppThemeState(
          style: AppStyle.darkImperial,
          theme: AppTheme.fromStyle(AppStyle.darkImperial),
        ),
      );

  void changeStyle(AppStyle style) {
    emit(state.copyWith(style: style, theme: AppTheme.fromStyle(style)));
  }
}
