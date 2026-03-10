import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/router/app_router.dart';
import 'package:mera_history/core/theme/app_theme_cubit.dart';
import 'package:mera_history/core/theme/app_theme_state.dart';
import 'package:mera_history/data/repositories/calendar_data_repository.dart';
import 'package:mera_history/data/repositories/hero_data_repository.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';
import 'package:mera_history/data/services/local_json_service.dart';
import 'package:mera_history/features/calendar/repository/calendar_repository.dart';
import 'package:mera_history/features/figures/repository/figures_repository.dart';
import 'package:mera_history/features/history/repository/history_repository.dart';
import 'package:mera_history/features/home/repository/home_repository.dart';
import 'package:mera_history/features/saved/repository/saved_repository.dart';

void main() {
  runApp(const MeraHistoryApp());
}

class MeraHistoryApp extends StatelessWidget {
  const MeraHistoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final jsonService = const LocalJsonService();
    final historyDataRepository = HistoryDataRepository(jsonService);
    final heroDataRepository = HeroDataRepository(jsonService);
    final calendarDataRepository = CalendarDataRepository(jsonService);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>(
          create: (_) => HomeRepositoryImpl(
            historyData: historyDataRepository,
            heroData: heroDataRepository,
          ),
        ),
        RepositoryProvider<CalendarRepository>(
          create: (_) => CalendarRepositoryImpl(
            calendarData: calendarDataRepository,
            historyData: historyDataRepository,
          ),
        ),
        RepositoryProvider<HistoryRepository>(
          create: (_) => HistoryRepositoryImpl(historyDataRepository),
        ),
        RepositoryProvider<FiguresRepository>(
          create: (_) => FiguresRepositoryImpl(
            heroData: heroDataRepository,
            historyData: historyDataRepository,
          ),
        ),
        RepositoryProvider<SavedRepository>(
          create: (_) => SavedRepositoryImpl(),
        ),
      ],
      child: BlocProvider(
        create: (_) => AppThemeCubit(),
        child: const AppRoot(),
      ),
    );
  }
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: 'MeraHistory',
          debugShowCheckedModeBanner: false,
          theme: state.theme,
          darkTheme: state.theme,
          themeMode: ThemeMode.dark,
          routerConfig: AppRouter.createRouter(),
        );
      },
    );
  }
}
