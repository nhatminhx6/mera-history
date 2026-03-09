import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/features/figures/bloc/figures_bloc.dart';
import 'package:mera_history/features/figures/repository/figures_repository.dart';
import 'package:mera_history/features/figures/view/figure_detail_screen.dart';
import 'package:mera_history/features/history/bloc/history_bloc.dart';
import 'package:mera_history/features/history/repository/history_repository.dart';
import 'package:mera_history/features/history/view/history_detail_screen.dart';
import 'package:mera_history/features/main_navigation/bloc/main_navigation_bloc.dart';
import 'package:mera_history/features/main_navigation/view/main_navigation_screen.dart';

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
          path: '/history/detail/:id',
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
          path: '/figures/:id',
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
      ],
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('ErrorScreen')),
        body: Center(child: Text(state.error.toString())),
      ),
    );
  }
}
