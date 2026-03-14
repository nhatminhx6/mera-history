import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/features/explore/view/battle_detail_screen.dart';
import 'package:mera_history/features/explore/view/dynasty_detail_screen.dart';
import 'package:mera_history/features/explore/view/figure_detail_screen.dart';
import 'package:mera_history/features/explore/view/history_detail_screen.dart';
import 'package:mera_history/features/explore/view/king_detail_screen.dart';
import 'package:mera_history/features/explore/view/parallel_timeline_screen.dart';
import 'package:mera_history/features/explore/view/explore_section_list_screen.dart';
import 'package:mera_history/features/explore/view/theme_detail_screen.dart';
import 'package:mera_history/features/figures/bloc/figures_bloc.dart';
import 'package:mera_history/features/figures/repository/figures_repository.dart';
import 'package:mera_history/features/history/bloc/history_bloc.dart';
import 'package:mera_history/features/history/repository/history_repository.dart';
import 'package:mera_history/features/main_navigation/bloc/main_navigation_bloc.dart';
import 'package:mera_history/features/main_navigation/view/main_navigation_screen.dart';
import 'package:mera_history/features/settings/view/theme_selector_screen.dart';

class AppRouter {
  AppRouter._();

  static GoRouter createRouter() {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (_) => MainNavigationBloc(),
            child: const MainNavigationScreen(),
          ),
        ),
        GoRoute(
          path: '/kham-pha/su-kien/:id',
          builder: (context, state) {
            final eventId = state.pathParameters['id'] ?? '';
            return BlocProvider(
              create: (context) =>
                  HistoryBloc(context.read<HistoryRepository>())
                    ..add(HistoryEvent.detailLoaded(eventId)),
              child: const HistoryDetailScreen(),
            );
          },
        ),
        GoRoute(
          path: '/kham-pha/nhan-vat/:id',
          builder: (context, state) {
            final figureId =
                int.tryParse(state.pathParameters['id'] ?? '0') ?? 0;
            return BlocProvider(
              create: (context) =>
                  FiguresBloc(context.read<FiguresRepository>())
                    ..add(FiguresEvent.detailLoaded(figureId)),
              child: const FigureDetailScreen(),
            );
          },
        ),
        GoRoute(
          path: '/kham-pha/trieu-dai/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return DynastyDetailScreen(dynastyId: id);
          },
        ),
        GoRoute(
          path: '/kham-pha/vua/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return KingDetailScreen(kingId: id);
          },
        ),
        GoRoute(
          path: '/kham-pha/tran-danh/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return BattleDetailScreen(battleId: id);
          },
        ),
        GoRoute(
          path: '/kham-pha/chu-de/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? '';
            return ThemeDetailScreen(themeId: id);
          },
        ),
        GoRoute(
          path: '/kham-pha/timeline-song-song',
          builder: (context, state) => const ParallelTimelineScreen(),
        ),
        GoRoute(
          path: '/kham-pha/danh-sach/:type',
          builder: (context, state) {
            final type = state.pathParameters['type'] ?? '';
            return ExploreSectionListScreen(type: type);
          },
        ),
        GoRoute(
          path: '/settings/theme',
          builder: (context, state) => const ThemeSelectorScreen(),
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Có lỗi xảy ra')),
        body: Center(child: Text(state.error.toString())),
      ),
    );
  }
}
