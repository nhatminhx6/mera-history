import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/constants/app_spacing.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/figures/bloc/figures_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class FigureDetailScreen extends StatelessWidget {
  const FigureDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FiguresBloc, FiguresState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => EmptyStateView(
                title: 'Unable to load figure',
                message: message,
                icon: Icons.error_outline,
              ),
              feed: (allFigures, filteredFigures, selectedFilter, query) =>
                  const SizedBox.shrink(),
              detail: (selectedFigure, relatedEvents) {
                if (selectedFigure == null) {
                  return const EmptyStateView(
                    title: 'Figure not found',
                    message: 'Please go back and pick another figure.',
                  );
                }
                return ListView(
                  padding: const EdgeInsets.only(bottom: 24),
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          selectedFigure.image,
                          width: double.infinity,
                          height: 300,
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
                        Positioned(
                          right: 12,
                          top: 12,
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
                      padding: AppSpacing.pagePadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            selectedFigure.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${selectedFigure.born} - ${selectedFigure.died} • ${selectedFigure.role}',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 4),
                          Text(selectedFigure.period),
                          const SizedBox(height: 14),
                          Text(
                            selectedFigure.description,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          AppSpacing.sectionGap,
                          const AppSectionHeader(title: 'Related Events'),
                          const SizedBox(height: 10),
                          ...relatedEvents.map(
                            (event) => Card(
                              child: ListTile(
                                title: Text(event.title),
                                subtitle: Text(
                                  '${event.year} • ${event.country}',
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                ),
                                onTap: () =>
                                    context.push('/history/detail/${event.id}'),
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
      ),
    );
  }
}
