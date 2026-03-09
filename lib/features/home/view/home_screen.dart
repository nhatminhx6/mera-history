import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mera_history/core/constants/app_spacing.dart';
import 'package:mera_history/features/home/bloc/home_bloc.dart';
import 'package:mera_history/features/main_navigation/bloc/main_navigation_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';
import 'package:mera_history/shared/widgets/event_card.dart';
import 'package:mera_history/shared/widgets/figure_card.dart';
import 'package:mera_history/shared/widgets/quick_action_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => EmptyStateView(
              title: 'Unable to load home',
              message: message,
              icon: Icons.error_outline,
            ),
            loaded: (dashboard) {
              final featured = dashboard.featuredEvent;
              return ListView(
                padding: const EdgeInsets.only(top: 12, bottom: 24),
                children: [
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'MeraHistory',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          DateFormat(
                            'EEEE, dd MMMM yyyy',
                          ).format(DateTime.now()),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Lunar date: placeholder',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Discover history through every day',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.sectionGap,
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: TextField(
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Search events, figures, dynasties',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onTap: () => context.read<MainNavigationBloc>().add(
                        const MainNavigationEvent.tabSelected(2),
                      ),
                    ),
                  ),
                  AppSpacing.sectionGap,
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: const AppSectionHeader(title: 'On This Day'),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: featured == null
                        ? const EmptyStateView(
                            title: 'No featured event',
                            message: 'Try another date from the calendar tab.',
                          )
                        : EventCard(
                            event: featured,
                            featured: true,
                            onTap: () =>
                                context.push('/history/detail/${featured.id}'),
                          ),
                  ),
                  AppSpacing.sectionGap,
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: const AppSectionHeader(title: 'Quick Access'),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      childAspectRatio: 1.4,
                      children: [
                        QuickActionCard(
                          title: 'Lunar Calendar',
                          icon: Icons.calendar_month,
                          onTap: () => context.read<MainNavigationBloc>().add(
                            const MainNavigationEvent.tabSelected(1),
                          ),
                        ),
                        QuickActionCard(
                          title: 'Today in History',
                          icon: Icons.history_edu,
                          onTap: () => context.read<MainNavigationBloc>().add(
                            const MainNavigationEvent.tabSelected(2),
                          ),
                        ),
                        QuickActionCard(
                          title: 'Historical Figures',
                          icon: Icons.account_balance,
                          onTap: () => context.read<MainNavigationBloc>().add(
                            const MainNavigationEvent.tabSelected(3),
                          ),
                        ),
                        QuickActionCard(
                          title: 'Timeline',
                          icon: Icons.timeline,
                          onTap: () => context.read<MainNavigationBloc>().add(
                            const MainNavigationEvent.tabSelected(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppSpacing.sectionGap,
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: const AppSectionHeader(title: 'Featured Figures'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 240,
                    child: ListView.separated(
                      padding: AppSpacing.pagePadding,
                      scrollDirection: Axis.horizontal,
                      itemCount: dashboard.featuredFigures.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final figure = dashboard.featuredFigures[index];
                        return SizedBox(
                          width: 180,
                          child: FigureCard(
                            figure: figure,
                            compact: true,
                            onTap: () => context.push('/figures/${figure.id}'),
                          ),
                        );
                      },
                    ),
                  ),
                  AppSpacing.sectionGap,
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: const AppSectionHeader(title: 'Dynasties & Periods'),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 42,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: AppSpacing.pagePadding,
                      children: const [
                        _DynastyChip(label: 'Ly'),
                        _DynastyChip(label: 'Tran'),
                        _DynastyChip(label: 'Le'),
                        _DynastyChip(label: 'Nguyen'),
                        _DynastyChip(label: 'Modern Vietnam'),
                      ],
                    ),
                  ),
                  AppSpacing.sectionGap,
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const AppSectionHeader(title: 'Daily Quiz'),
                            const SizedBox(height: 8),
                            Text(
                              'Who led the Tay Son army in 1789?',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 12),
                            FilledButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Quiz coming soon'),
                                  ),
                                );
                              },
                              child: const Text('Try now'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _DynastyChip extends StatelessWidget {
  const _DynastyChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(label: Text(label)),
    );
  }
}
