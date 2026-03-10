import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/figures/bloc/figures_bloc.dart';
import 'package:mera_history/features/history/bloc/history_bloc.dart';
import 'package:mera_history/features/history/models/history_models.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';
import 'package:mera_history/shared/widgets/event_card.dart';
import 'package:mera_history/shared/widgets/popular_figure_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(top: spacing.sm, bottom: spacing.lg),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing.md),
            child: const AppSectionHeader(title: 'Khám phá'),
          ),
          SizedBox(height: spacing.sm),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing.md),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Tìm kiếm sự kiện, nhân vật, triều đại',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                context.read<HistoryBloc>().add(
                  HistoryEvent.queryChanged(value),
                );
                context.read<FiguresBloc>().add(
                  FiguresEvent.queryChanged(value),
                );
              },
            ),
          ),
          SizedBox(height: spacing.sm),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: spacing.md),
              children: [
                _ExploreChip(
                  label: 'Dòng thời gian',
                  onTap: () => context.read<HistoryBloc>().add(
                    const HistoryEvent.filterChanged(HistoryFilter.timeline),
                  ),
                ),
                _ExploreChip(
                  label: 'Việt Nam',
                  onTap: () => context.read<HistoryBloc>().add(
                    const HistoryEvent.filterChanged(HistoryFilter.vietnam),
                  ),
                ),
                _ExploreChip(
                  label: 'Thế giới',
                  onTap: () => context.read<HistoryBloc>().add(
                    const HistoryEvent.filterChanged(HistoryFilter.world),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: spacing.md),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing.md),
            child: const AppSectionHeader(title: 'Sự kiện nổi bật'),
          ),
          SizedBox(height: spacing.xs),
          BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              return state.maybeWhen(
                feed: (allEvents, filteredEvents, selectedFilter, query) {
                  if (filteredEvents.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: EmptyStateView(
                        title: 'Chưa có nội dung phù hợp',
                        message: 'Hãy thử từ khóa hoặc bộ lọc khác.',
                      ),
                    );
                  }
                  return Column(
                    children: filteredEvents
                        .take(5)
                        .map(
                          (event) => Padding(
                            padding: EdgeInsets.fromLTRB(
                              spacing.md,
                              0,
                              spacing.md,
                              spacing.sm,
                            ),
                            child: EventCard(
                              event: event,
                              onTap: () =>
                                  context.push('/kham-pha/su-kien/${event.id}'),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
                orElse: () => const Center(child: CircularProgressIndicator()),
              );
            },
          ),
          SizedBox(height: spacing.md),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing.md),
            child: const AppSectionHeader(title: 'Nhân vật đáng chú ý'),
          ),
          SizedBox(height: spacing.xs),
          SizedBox(
            height: 180,
            child: BlocBuilder<FiguresBloc, FiguresState>(
              builder: (context, state) {
                return state.maybeWhen(
                  feed: (allFigures, filteredFigures, selectedFilter, query) {
                    final figures = filteredFigures.isEmpty
                        ? allFigures.take(4).toList()
                        : filteredFigures.take(4).toList();
                    return ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: spacing.md),
                      scrollDirection: Axis.horizontal,
                      itemCount: figures.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: spacing.xs),
                      itemBuilder: (context, index) {
                        final figure = figures[index];
                        return PopularFigureCard(
                          figure: figure,
                          onTap: () =>
                              context.push('/kham-pha/nhan-vat/${figure.id}'),
                        );
                      },
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ExploreChip extends StatelessWidget {
  const _ExploreChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ActionChip(label: Text(label), onPressed: onTap),
    );
  }
}
