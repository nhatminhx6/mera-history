import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/history/bloc/history_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final topInset = MediaQuery.paddingOf(context).top + 8;

    return Scaffold(
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => EmptyStateView(
              title: 'Không thể tải chi tiết',
              message: message,
              icon: Icons.error_outline,
            ),
            feed: (allEvents, filteredEvents, selectedFilter, query) =>
                const SizedBox.shrink(),
            detail: (selectedEvent, relatedEvents) {
              if (selectedEvent == null) {
                return const EmptyStateView(
                  title: 'Không tìm thấy sự kiện',
                  message: 'Vui lòng quay lại danh sách.',
                );
              }

              return ListView(
                padding: EdgeInsets.only(bottom: spacing.lg),
                children: [
                  Stack(
                    children: [
                      Image.network(
                        selectedEvent.image,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 12,
                        top: topInset,
                        child: CircleAvatar(
                          backgroundColor: context.appColors.heroOverlayStart,
                          child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.arrow_back),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 12,
                        top: topInset,
                        child: CircleAvatar(
                          backgroundColor: context.appColors.heroOverlayStart,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_outline),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: spacing.md),
                        Text(
                          '${selectedEvent.year} • ${selectedEvent.country}',
                          style: context.textTheme.labelLarge,
                        ),
                        SizedBox(height: spacing.xxs),
                        Text(
                          selectedEvent.title,
                          style: context.textTheme.headlineSmall,
                        ),
                        SizedBox(height: spacing.xs),
                        Text(
                          selectedEvent.description,
                          style: context.textTheme.bodyLarge,
                        ),
                        SizedBox(height: spacing.lg),
                        const AppSectionHeader(title: 'Sự kiện liên quan'),
                        SizedBox(height: spacing.xs),
                        ...relatedEvents.map(
                          (event) => Card(
                            child: ListTile(
                              title: Text(event.title),
                              subtitle: Text('${event.year}'),
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
}
