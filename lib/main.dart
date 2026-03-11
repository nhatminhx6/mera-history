import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/router/app_router.dart';
import 'package:mera_history/core/theme/app_theme_cubit.dart';
import 'package:mera_history/core/theme/app_theme_state.dart';
import 'package:mera_history/data/datasources/local/mock_daily_quiz_datasource.dart';
import 'package:mera_history/data/datasources/local/mock_dynasty_datasource.dart';
import 'package:mera_history/data/datasources/local/mock_event_datasource.dart';
import 'package:mera_history/data/datasources/local/mock_figure_datasource.dart';
import 'package:mera_history/data/datasources/local/mock_profile_datasource.dart';
import 'package:mera_history/data/datasources/local/mock_saved_datasource.dart';
import 'package:mera_history/data/repositories/calendar_data_repository.dart';
import 'package:mera_history/data/repositories/daily_advice_repository.dart';
import 'package:mera_history/data/repositories/daily_quiz_repository.dart';
import 'package:mera_history/data/repositories/dynasty_repository_impl.dart';
import 'package:mera_history/data/repositories/event_repository_impl.dart';
import 'package:mera_history/data/repositories/figure_repository_impl.dart';
import 'package:mera_history/data/repositories/hero_data_repository.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';
import 'package:mera_history/data/repositories/profile_stats_repository.dart';
import 'package:mera_history/data/repositories/saved_content_repository.dart';
import 'package:mera_history/data/services/local_json_service.dart';
import 'package:mera_history/features/calendar/repository/calendar_repository.dart';
import 'package:mera_history/features/calendar/repository/lunar_day_repository.dart';
import 'package:mera_history/features/figures/repository/figures_repository.dart';
import 'package:mera_history/features/history/repository/history_repository.dart';
import 'package:mera_history/features/home/repository/home_repository.dart';
import 'package:mera_history/features/profile/repository/profile_repository.dart';
import 'package:mera_history/features/saved/repository/saved_repository.dart';

void main() {
  runApp(const MeraHistoryApp());
}

class MeraHistoryApp extends StatelessWidget {
  const MeraHistoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    final jsonService = const LocalJsonService();
    final mockDailyQuizDataSource = MockDailyQuizDataSource(jsonService);
    final mockDynastyDataSource = MockDynastyDataSource(jsonService);
    final mockEventDataSource = MockEventDataSource(jsonService);
    final mockFigureDataSource = MockFigureDataSource(jsonService);
    final mockSavedDataSource = MockSavedDataSource(jsonService);
    final mockProfileDataSource = MockProfileDataSource(jsonService);

    final dailyQuizRepository = DailyQuizRepository(mockDailyQuizDataSource);
    final dynastyRepository = DynastyRepositoryImpl(mockDynastyDataSource);
    final eventApiRepository = EventRepositoryImpl(mockEventDataSource);
    final figureApiRepository = FigureRepositoryImpl(mockFigureDataSource);
    final savedContentRepository = SavedContentRepository(mockSavedDataSource);
    final profileStatsRepository = ProfileStatsRepository(
      mockProfileDataSource,
    );

    final historyDataRepository = HistoryDataRepository(eventApiRepository);
    final heroDataRepository = HeroDataRepository(figureApiRepository);
    final calendarDataRepository = CalendarDataRepository(eventApiRepository);
    final lunarDayRepository = LunarDayRepository(jsonService);
    final dailyAdviceRepository = DailyAdviceRepository(jsonService);
    final savedRepository = SavedRepositoryImpl(
      savedContentRepository: savedContentRepository,
      historyDataRepository: historyDataRepository,
      heroDataRepository: heroDataRepository,
      figureRepository: figureApiRepository,
    );
    final profileRepository = ProfileRepositoryImpl(
      profileStatsRepository: profileStatsRepository,
      savedRepository: savedRepository,
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>(
          create: (_) => HomeRepositoryImpl(
            historyData: historyDataRepository,
            heroData: heroDataRepository,
            dailyAdviceRepository: dailyAdviceRepository,
            lunarDayRepository: lunarDayRepository,
            dynastyRepository: dynastyRepository,
            dailyQuizRepository: dailyQuizRepository,
          ),
        ),
        RepositoryProvider<CalendarRepository>(
          create: (_) => CalendarRepositoryImpl(
            calendarData: calendarDataRepository,
            historyData: historyDataRepository,
            lunarDayRepository: lunarDayRepository,
            dailyAdviceRepository: dailyAdviceRepository,
          ),
        ),
        RepositoryProvider<HistoryRepository>(
          create: (_) => HistoryRepositoryImpl(historyDataRepository),
        ),
        RepositoryProvider<FiguresRepository>(
          create: (_) => FiguresRepositoryImpl(
            heroData: heroDataRepository,
            figureApiRepository: figureApiRepository,
            eventApiRepository: eventApiRepository,
          ),
        ),
        RepositoryProvider<SavedRepository>(create: (_) => savedRepository),
        RepositoryProvider<ProfileRepository>(create: (_) => profileRepository),
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
