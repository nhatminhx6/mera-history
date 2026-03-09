import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/constants/app_spacing.dart';
import 'package:mera_history/features/history/bloc/history_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HistoryBloc, HistoryState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => EmptyStateView(
                title: 'Unable to load event',
                message: message,
                icon: Icons.error_outline,
              ),
              feed: (allEvents, filteredEvents, selectedFilter, query) =>
                  const SizedBox.shrink(),
              detail: (selectedEvent, relatedEvents) {
                if (selectedEvent == null) {
                  return const EmptyStateView(
                    title: 'Event not found',
                    message: 'Please go back and try another item.',
                  );
                }
                return ListView(
                  padding: const EdgeInsets.only(bottom: 24),
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          selectedEvent.image,
                          height: 280,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 12,
                          top: 12,
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 12,
                          top: 12,
                          child: CircleAvatar(
                            backgroundColor: Colors.black54,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.bookmark_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: AppSpacing.pagePadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Chip(
                            label: Text(
                              '${selectedEvent.year} • ${selectedEvent.country}',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            selectedEvent.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            selectedEvent.description,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          AppSpacing.sectionGap,
                          const AppSectionHeader(title: 'Timeline'),
                          const SizedBox(height: 10),
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Column(
                                children: relatedEvents
                                    .map(
                                      (e) => ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        title: Text(e.title),
                                        subtitle: Text('${e.year}'),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                          AppSpacing.sectionGap,
                          const AppSectionHeader(title: 'Related Figures'),
                          const SizedBox(height: 10),
                          const Card(
                            child: Padding(
                              padding: EdgeInsets.all(14),
                              child: Text('Related figures placeholder'),
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
      ),
    );
  }
}
