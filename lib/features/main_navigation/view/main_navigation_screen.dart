import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/features/calendar/bloc/calendar_bloc.dart';
import 'package:mera_history/features/calendar/repository/calendar_repository.dart';
import 'package:mera_history/features/calendar/view/calendar_screen.dart';
import 'package:mera_history/features/explore/view/explore_screen.dart';
import 'package:mera_history/features/figures/bloc/figures_bloc.dart';
import 'package:mera_history/features/figures/repository/figures_repository.dart';
import 'package:mera_history/features/home/bloc/home_bloc.dart';
import 'package:mera_history/features/home/repository/home_repository.dart';
import 'package:mera_history/features/home/view/home_screen.dart';
import 'package:mera_history/features/history/bloc/history_bloc.dart';
import 'package:mera_history/features/history/repository/history_repository.dart';
import 'package:mera_history/features/main_navigation/bloc/main_navigation_bloc.dart';
import 'package:mera_history/features/profile/bloc/profile_bloc.dart';
import 'package:mera_history/features/profile/repository/profile_repository.dart';
import 'package:mera_history/features/profile/view/profile_screen.dart';
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
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                HistoryBloc(context.read<HistoryRepository>())
                  ..add(const HistoryEvent.feedLoaded()),
          ),
          BlocProvider(
            create: (context) =>
                FiguresBloc(context.read<FiguresRepository>())
                  ..add(const FiguresEvent.feedLoaded()),
          ),
        ],
        child: const ExploreScreen(),
      ),
      BlocProvider(
        create: (context) =>
            SavedBloc(context.read<SavedRepository>())
              ..add(const SavedEvent.started()),
        child: const SavedScreen(),
      ),
      BlocProvider(
        create: (context) =>
            ProfileBloc(context.read<ProfileRepository>())
              ..add(const ProfileEvent.started()),
        child: const ProfileScreen(),
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
                label: 'Trang chủ',
              ),
              NavigationDestination(
                icon: Icon(Icons.calendar_month_outlined),
                selectedIcon: Icon(Icons.calendar_month),
                label: 'Lịch',
              ),
              NavigationDestination(
                icon: Icon(Icons.explore_outlined),
                selectedIcon: Icon(Icons.explore),
                label: 'Khám phá',
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmark_outline),
                selectedIcon: Icon(Icons.bookmark),
                label: 'Đã lưu',
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: 'Cá nhân',
              ),
            ],
          ),
        );
      },
    );
  }
}
