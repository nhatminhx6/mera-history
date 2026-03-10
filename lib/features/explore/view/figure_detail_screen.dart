import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/figures/bloc/figures_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class FigureDetailScreen extends StatelessWidget {
  const FigureDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FiguresBloc, FiguresState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => EmptyStateView(
                title: 'Không thể tải hồ sơ',
                message: message,
                icon: Icons.error_outline,
              ),
              feed: (allFigures, filteredFigures, selectedFilter, query) =>
                  const SizedBox.shrink(),
              detail: (selectedFigure, relatedEvents) {
                if (selectedFigure == null) {
                  return const EmptyStateView(
                    title: 'Không tìm thấy nhân vật',
                    message: 'Vui lòng quay lại danh sách.',
                  );
                }

                return ListView(
                  padding: EdgeInsets.only(bottom: spacing.lg),
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          selectedFigure.image,
                          width: double.infinity,
                          height: 320,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: 12,
                          top: 12,
                          child: CircleAvatar(
                            backgroundColor: context.appColors.heroOverlayStart,
                            child: IconButton(
                              onPressed: () => context.pop(),
                              icon: const Icon(Icons.arrow_back),
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
                            selectedFigure.name,
                            style: context.textTheme.headlineSmall,
                          ),
                          SizedBox(height: spacing.xxs),
                          Text(
                            selectedFigure.role,
                            style: context.textTheme.titleMedium,
                          ),
                          SizedBox(height: spacing.xxs),
                          Text(
                            selectedFigure.period,
                            style: context.textTheme.bodyMedium,
                          ),
                          SizedBox(height: spacing.sm),
                          Text(
                            selectedFigure.description,
                            style: context.textTheme.bodyLarge,
                          ),
                          SizedBox(height: spacing.lg),
                          const AppSectionHeader(title: 'Mốc thời gian'),
                          SizedBox(height: spacing.xs),
                          const Card(
                            child: ListTile(
                              title: Text('Mốc tiêu biểu sẽ được cập nhật'),
                            ),
                          ),
                          SizedBox(height: spacing.md),
                          const AppSectionHeader(title: 'Sự kiện liên quan'),
                          SizedBox(height: spacing.xs),
                          ...relatedEvents.map(
                            (event) => Card(
                              child: ListTile(
                                title: Text(event.title),
                                subtitle: Text(
                                  '${event.year} • ${event.country}',
                                ),
                                onTap: () => context.push(
                                  '/kham-pha/su-kien/${event.id}',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: spacing.sm),
                          FilledButton(
                            onPressed: () {},
                            child: const Text('Xem chi tiết'),
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
