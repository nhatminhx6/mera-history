import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/bloc/explore_bloc.dart';
import 'package:mera_history/features/explore/models/explore_hub_data.dart';
import 'package:mera_history/features/explore/models/historical_theme.dart';
import 'package:mera_history/features/explore/models/king.dart';
import 'package:mera_history/features/explore/models/dynasty.dart';
import 'package:mera_history/features/explore/models/battle.dart';
import 'package:mera_history/features/explore/models/parallel_timeline_item.dart';
import 'package:mera_history/features/explore/repository/explore_repository.dart';
import 'package:mera_history/features/explore/view/widgets/battle_card.dart';
import 'package:mera_history/features/explore/view/widgets/dynasty_card.dart';
import 'package:mera_history/features/explore/view/widgets/explore_section_header.dart';
import 'package:mera_history/features/explore/view/widgets/explore_reveal.dart';
import 'package:mera_history/features/explore/view/widgets/featured_event_card.dart';
import 'package:mera_history/features/explore/view/widgets/figure_card.dart';
import 'package:mera_history/features/explore/view/widgets/king_card.dart';
import 'package:mera_history/features/explore/view/widgets/parallel_timeline_card.dart';
import 'package:mera_history/features/explore/view/widgets/random_discovery_card.dart';
import 'package:mera_history/features/explore/view/widgets/theme_card.dart';
import 'package:mera_history/features/explore/view/widgets/timeline_period_card.dart';
import 'package:mera_history/features/explore/view/widgets/today_history_card.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SafeArea(
      child: BlocBuilder<ExploreBloc, ExploreState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => EmptyStateView(
              title: 'Không thể tải khám phá',
              message: message,
              icon: Icons.error_outline,
            ),
            loaded: (hub, query, selectedFilter, selectedFigureRole) {
              final featuredEvents = _filterEvents(
                source: hub.featuredEvents,
                query: query,
                selectedFilter: selectedFilter,
              );
              final dynasties = _filterDynasties(
                source: hub.dynasties,
                query: query,
                selectedFilter: selectedFilter,
              );
              final kings = _filterKings(
                source: hub.kings,
                query: query,
                selectedFilter: selectedFilter,
              );
              final figures = _filterFigures(
                source: hub.figures,
                query: query,
                selectedFilter: selectedFilter,
                selectedRole: selectedFigureRole,
              );
              final battles = _filterBattles(
                source: hub.battles,
                query: query,
                selectedFilter: selectedFilter,
              );
              final themes = _filterThemes(source: hub.themes, query: query);
              final todayEvents = _filterTodayEvents(
                source: hub.todayEvents,
                query: query,
              );
              final timelines = _filterTimelines(
                source: hub.parallelTimelines,
                query: query,
                selectedFilter: selectedFilter,
              );

              return ListView(
                padding: EdgeInsets.fromLTRB(
                  spacing.md,
                  spacing.sm,
                  spacing.md,
                  spacing.lg,
                ),
                children: [
                  ExploreReveal(
                    delayMs: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExploreSectionHeader(
                          title: 'Khám phá',
                          subtitle: 'Trung tâm dữ liệu lịch sử Việt Nam',
                        ),
                        SizedBox(height: spacing.sm),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              context.appRadius.xl,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                context.colorScheme.primary.withValues(
                                  alpha: 0.14,
                                ),
                                context.colorScheme.surface.withValues(
                                  alpha: 0.01,
                                ),
                              ],
                            ),
                          ),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintText: 'Tìm kiếm sự kiện, nhân vật, triều đại',
                              prefixIcon: Icon(Icons.search),
                            ),
                            onChanged: (value) => context
                                .read<ExploreBloc>()
                                .add(ExploreEvent.queryChanged(value)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExploreSectionHeader(
                          title: 'Bộ lọc',
                          subtitle: 'Lọc nhanh theo tuyến nội dung',
                        ),
                        SizedBox(height: spacing.xs),
                        SizedBox(
                          height: 42,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: hub.config.filterChips.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: spacing.xs),
                            itemBuilder: (context, index) {
                              final chip = hub.config.filterChips[index];
                              return ChoiceChip(
                                label: Text(chip),
                                selected: selectedFilter == chip,
                                onSelected: (selected) => context
                                    .read<ExploreBloc>()
                                    .add(ExploreEvent.filterChanged(chip)),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 140,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExploreSectionHeader(title: 'Sự kiện nổi bật'),
                        SizedBox(height: spacing.xs),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 260),
                          child: Column(
                            key: ValueKey('featured-$query-$selectedFilter'),
                            children: featuredEvents
                                .take(4)
                                .map(
                                  (event) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: spacing.sm,
                                    ),
                                    child: FeaturedEventCard(
                                      event: event,
                                      onTap: () => context.push(
                                        '/kham-pha/su-kien/${event.id}',
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 210,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExploreSectionHeader(
                          title: 'Dòng thời gian lịch sử',
                        ),
                        SizedBox(height: spacing.xs),
                        _horizontalDynastyList(
                          context,
                          dynasties: dynasties,
                          height: 150,
                          asTimeline: true,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ExploreSectionHeader(
                          title: 'Dòng thời gian song song',
                          action: TextButton(
                            onPressed: () =>
                                context.push('/kham-pha/timeline-song-song'),
                            child: const Text('Xem tất cả'),
                          ),
                        ),
                        SizedBox(height: spacing.xs),
                        SizedBox(
                          height: 270,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: timelines.take(8).length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: spacing.xs),
                            itemBuilder: (context, index) =>
                                ParallelTimelineCard(item: timelines[index]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExploreSectionHeader(
                          title: 'Các triều đại Việt Nam',
                        ),
                        SizedBox(height: spacing.xs),
                        _horizontalDynastyList(
                          context,
                          dynasties: dynasties,
                          height: 150,
                          asTimeline: false,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 420,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExploreSectionHeader(
                          title: 'Các vị vua Việt Nam',
                        ),
                        SizedBox(height: spacing.xs),
                        SizedBox(
                          height: 230,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: kings.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: spacing.xs),
                            itemBuilder: (context, index) {
                              final item = kings[index];
                              return KingCard(
                                king: item,
                                onTap: () =>
                                    context.push('/kham-pha/vua/${item.id}'),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 490,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExploreSectionHeader(title: 'Nhân vật lịch sử'),
                        SizedBox(height: spacing.xs),
                        SizedBox(
                          height: 38,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: hub.config.figureRoleChips.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: spacing.xs),
                            itemBuilder: (context, index) {
                              final role = hub.config.figureRoleChips[index];
                              return ChoiceChip(
                                label: Text(role),
                                selected: selectedFigureRole == role,
                                onSelected: (selected) => context
                                    .read<ExploreBloc>()
                                    .add(ExploreEvent.figureRoleChanged(role)),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: spacing.sm),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 260),
                          child: GridView.builder(
                            key: ValueKey('figures-$query-$selectedFigureRole'),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: figures.take(6).length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 0.72,
                                ),
                            itemBuilder: (context, index) {
                              final item = figures[index];
                              return ExploreFigureCard(
                                figure: item,
                                onTap: () {
                                  if (item.heroId > 0) {
                                    context.push(
                                      '/kham-pha/nhan-vat/${item.heroId}',
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 560,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExploreSectionHeader(
                          title: 'Các trận đánh nổi bật',
                        ),
                        SizedBox(height: spacing.xs),
                        SizedBox(
                          height: 130,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: battles.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: spacing.xs),
                            itemBuilder: (context, index) {
                              final item = battles[index];
                              return BattleCard(
                                battle: item,
                                onTap: () => context.push(
                                  '/kham-pha/tran-danh/${item.id}',
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 630,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExploreSectionHeader(title: 'Chủ đề lịch sử'),
                        SizedBox(height: spacing.xs),
                        ...themes.map(
                          (theme) => Padding(
                            padding: EdgeInsets.only(bottom: spacing.sm),
                            child: ThemeCard(
                              theme: theme,
                              onTap: () =>
                                  context.push('/kham-pha/chu-de/${theme.id}'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 700,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExploreSectionHeader(
                          title: 'Khám phá ngẫu nhiên',
                        ),
                        SizedBox(height: spacing.xs),
                        RandomDiscoveryCard(
                          title: hub.config.randomTitle,
                          description: hub.config.randomDescription,
                          buttonText: hub.config.randomButton,
                          onTap: () {
                            final random = context
                                .read<ExploreRepository>()
                                .randomTarget(hub);
                            context.push(random.route);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  ExploreReveal(
                    delayMs: 770,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ExploreSectionHeader(
                          title: 'Hôm nay trong lịch sử Việt Nam',
                        ),
                        SizedBox(height: spacing.xs),
                        if (todayEvents.isEmpty)
                          const EmptyStateView(
                            title: 'Chưa có sự kiện trùng ngày',
                            message:
                                'Hãy quay lại vào ngày khác để khám phá thêm.',
                          )
                        else
                          ...todayEvents.map(
                            (event) => Padding(
                              padding: EdgeInsets.only(bottom: spacing.sm),
                              child: TodayHistoryCard(
                                event: event,
                                onTap: () => context.push(
                                  '/kham-pha/su-kien/${event.id}',
                                ),
                              ),
                            ),
                          ),
                      ],
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

  Widget _horizontalDynastyList(
    BuildContext context, {
    required List<Dynasty> dynasties,
    required double height,
    required bool asTimeline,
  }) {
    final spacing = context.appSpacing;
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dynasties.length,
        separatorBuilder: (context, index) => SizedBox(width: spacing.xs),
        itemBuilder: (context, index) {
          final item = dynasties[index];
          if (asTimeline) {
            return TimelinePeriodCard(
              dynasty: item,
              onTap: () => context.push('/kham-pha/trieu-dai/${item.id}'),
            );
          }
          return DynastyCard(
            dynasty: item,
            onTap: () => context.push('/kham-pha/trieu-dai/${item.id}'),
          );
        },
      ),
    );
  }

  List<ExploreEventItem> _filterEvents({
    required List<ExploreEventItem> source,
    required String query,
    required String selectedFilter,
  }) {
    return source.where((event) {
      final matchesQuery =
          query.isEmpty ||
          event.title.toLowerCase().contains(query.toLowerCase()) ||
          event.summary.toLowerCase().contains(query.toLowerCase());
      if (!matchesQuery) {
        return false;
      }
      if (selectedFilter == 'Việt Nam') {
        return event.context != 'Bối cảnh khu vực';
      }
      if (selectedFilter == 'Thế giới' || selectedFilter == 'Trung Quốc') {
        return event.context == 'Bối cảnh khu vực';
      }
      return true;
    }).toList();
  }

  List<Dynasty> _filterDynasties({
    required List<Dynasty> source,
    required String query,
    required String selectedFilter,
  }) {
    if (selectedFilter.isNotEmpty &&
        selectedFilter != 'Dòng thời gian' &&
        selectedFilter != 'Triều đại') {
      return source;
    }
    return source
        .where(
          (item) =>
              query.isEmpty ||
              item.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  List<King> _filterKings({
    required List<King> source,
    required String query,
    required String selectedFilter,
  }) {
    if (selectedFilter.isNotEmpty && selectedFilter != 'Nhân vật') {
      return source;
    }
    return source
        .where(
          (item) =>
              query.isEmpty ||
              item.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  List<ExploreFigure> _filterFigures({
    required List<ExploreFigure> source,
    required String query,
    required String selectedFilter,
    required String selectedRole,
  }) {
    if (selectedFilter.isNotEmpty && selectedFilter != 'Nhân vật') {
      return source;
    }
    return source.where((item) {
      final matchesQuery =
          query.isEmpty ||
          item.name.toLowerCase().contains(query.toLowerCase()) ||
          item.role.toLowerCase().contains(query.toLowerCase());
      final matchesRole = selectedRole.isEmpty || item.role == selectedRole;
      return matchesQuery && matchesRole;
    }).toList();
  }

  List<Battle> _filterBattles({
    required List<Battle> source,
    required String query,
    required String selectedFilter,
  }) {
    if (selectedFilter.isNotEmpty && selectedFilter != 'Trận đánh') {
      return source;
    }
    return source
        .where(
          (item) =>
              query.isEmpty ||
              item.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  List<HistoricalTheme> _filterThemes({
    required List<HistoricalTheme> source,
    required String query,
  }) {
    return source
        .where(
          (item) =>
              query.isEmpty ||
              item.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  List<ExploreEventItem> _filterTodayEvents({
    required List<ExploreEventItem> source,
    required String query,
  }) {
    return source
        .where(
          (event) =>
              query.isEmpty ||
              event.title.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }

  List<ParallelTimelineItem> _filterTimelines({
    required List<ParallelTimelineItem> source,
    required String query,
    required String selectedFilter,
  }) {
    if (selectedFilter.isNotEmpty && selectedFilter != 'Dòng thời gian') {
      return source;
    }
    return source
        .where(
          (item) =>
              query.isEmpty ||
              item.vietnam.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
