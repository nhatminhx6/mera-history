import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/constants/app_spacing.dart';
import 'package:mera_history/features/history/bloc/history_bloc.dart';
import 'package:mera_history/features/history/models/history_models.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';
import 'package:mera_history/shared/widgets/event_card.dart';

class HistoryListScreen extends StatelessWidget {
  const HistoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => EmptyStateView(
              title: 'Cannot load history feed',
              message: message,
              icon: Icons.error_outline,
            ),
            detail: (selectedEvent, relatedEvents) => const SizedBox.shrink(),
            feed: (allEvents, filteredEvents, selectedFilter, query) {
              return ListView(
                padding: const EdgeInsets.only(top: 12, bottom: 24),
                children: [
                  const Padding(
                    padding: AppSpacing.pagePadding,
                    child: AppSectionHeader(title: 'History'),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search events, periods, places',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) => context.read<HistoryBloc>().add(
                        HistoryEvent.queryChanged(value),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: AppSpacing.pagePadding,
                      children: [
                        _FilterChip(
                          label: 'Today',
                          selected: selectedFilter == HistoryFilter.today,
                          onTap: () => context.read<HistoryBloc>().add(
                            const HistoryEvent.filterChanged(
                              HistoryFilter.today,
                            ),
                          ),
                        ),
                        _FilterChip(
                          label: 'Vietnam',
                          selected: selectedFilter == HistoryFilter.vietnam,
                          onTap: () => context.read<HistoryBloc>().add(
                            const HistoryEvent.filterChanged(
                              HistoryFilter.vietnam,
                            ),
                          ),
                        ),
                        _FilterChip(
                          label: 'World',
                          selected: selectedFilter == HistoryFilter.world,
                          onTap: () => context.read<HistoryBloc>().add(
                            const HistoryEvent.filterChanged(
                              HistoryFilter.world,
                            ),
                          ),
                        ),
                        _FilterChip(
                          label: 'Timeline',
                          selected: selectedFilter == HistoryFilter.timeline,
                          onTap: () => context.read<HistoryBloc>().add(
                            const HistoryEvent.filterChanged(
                              HistoryFilter.timeline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (filteredEvents.isEmpty)
                    const Padding(
                      padding: AppSpacing.pagePadding,
                      child: EmptyStateView(
                        title: 'No events found',
                        message: 'Try another keyword or filter.',
                      ),
                    )
                  else
                    ...filteredEvents.map(
                      (event) => Padding(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                        child: EventCard(
                          event: event,
                          onTap: () =>
                              context.push('/history/detail/${event.id}'),
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

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap(),
      ),
    );
  }
}
