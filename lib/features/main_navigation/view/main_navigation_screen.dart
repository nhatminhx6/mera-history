import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/features/calendar/bloc/calendar_bloc.dart';
import 'package:mera_history/features/calendar/repository/calendar_repository.dart';
import 'package:mera_history/features/calendar/view/calendar_screen.dart';
import 'package:mera_history/features/figures/bloc/figures_bloc.dart';
import 'package:mera_history/features/figures/repository/figures_repository.dart';
import 'package:mera_history/features/figures/view/figures_screen.dart';
import 'package:mera_history/features/history/bloc/history_bloc.dart';
import 'package:mera_history/features/history/repository/history_repository.dart';
import 'package:mera_history/features/history/view/history_list_screen.dart';
import 'package:mera_history/features/home/bloc/home_bloc.dart';
import 'package:mera_history/features/home/repository/home_repository.dart';
import 'package:mera_history/features/home/view/home_screen.dart';
import 'package:mera_history/features/main_navigation/bloc/main_navigation_bloc.dart';
import 'package:mera_history/features/saved/bloc/saved_bloc.dart';
import 'package:mera_history/features/saved/repository/saved_repository.dart';
import 'package:mera_history/features/saved/view/saved_screen.dart';

class MainNavigationScreen extends StatelessWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      BlocProvider(
        create: (context) =>
            HomeBloc(context.read<HomeRepository>())
              ..add(const HomeEvent.started()),
        child: const HomeScreen(),
      ),
      BlocProvider(
        create: (context) =>
            CalendarBloc(context.read<CalendarRepository>())
              ..add(const CalendarEvent.started()),
        child: const CalendarScreen(),
      ),
      BlocProvider(
        create: (context) =>
            HistoryBloc(context.read<HistoryRepository>())
              ..add(const HistoryEvent.feedLoaded()),
        child: const HistoryListScreen(),
      ),
      BlocProvider(
        create: (context) =>
            FiguresBloc(context.read<FiguresRepository>())
              ..add(const FiguresEvent.feedLoaded()),
        child: const FiguresScreen(),
      ),
      BlocProvider(
        create: (context) =>
            SavedBloc(context.read<SavedRepository>())
              ..add(const SavedEvent.started()),
        child: const SavedScreen(),
      ),
    ];

    return BlocBuilder<MainNavigationBloc, MainNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: state.index, children: tabs),
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.index,
            onDestinationSelected: (index) {
              context.read<MainNavigationBloc>().add(
                MainNavigationEvent.tabSelected(index),
              );
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_month_outlined),
                selectedIcon: Icon(Icons.calendar_month),
                label: 'Calendar',
              ),
              NavigationDestination(
                icon: Icon(Icons.history_edu_outlined),
                selectedIcon: Icon(Icons.history_edu),
                label: 'History',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_balance_outlined),
                selectedIcon: Icon(Icons.account_balance),
                label: 'Figures',
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmark_outline),
                selectedIcon: Icon(Icons.bookmark),
                label: 'Saved',
              ),
            ],
          ),
        );
      },
    );
  }
}
