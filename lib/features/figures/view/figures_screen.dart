import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/constants/app_spacing.dart';
import 'package:mera_history/features/figures/bloc/figures_bloc.dart';
import 'package:mera_history/features/figures/models/figures_models.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';
import 'package:mera_history/shared/widgets/figure_card.dart';

class FiguresScreen extends StatelessWidget {
  const FiguresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<FiguresBloc, FiguresState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => EmptyStateView(
              title: 'Cannot load figures',
              message: message,
              icon: Icons.error_outline,
            ),
            detail: (selectedFigure, relatedEvents) => const SizedBox.shrink(),
            feed: (allFigures, filteredFigures, selectedFilter, query) {
              return ListView(
                padding: const EdgeInsets.only(top: 12, bottom: 24),
                children: [
                  const Padding(
                    padding: AppSpacing.pagePadding,
                    child: AppSectionHeader(title: 'Figures'),
                  ),
                  const SizedBox(height: 12),
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: 'Search figures, roles, periods',
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) => context.read<FiguresBloc>().add(
                        FiguresEvent.queryChanged(value),
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
                        _FigureFilterChip(
                          label: 'Generals',
                          selected: selectedFilter == FigureFilter.generals,
                          onTap: () => context.read<FiguresBloc>().add(
                            const FiguresEvent.filterChanged(
                              FigureFilter.generals,
                            ),
                          ),
                        ),
                        _FigureFilterChip(
                          label: 'Emperors',
                          selected: selectedFilter == FigureFilter.emperors,
                          onTap: () => context.read<FiguresBloc>().add(
                            const FiguresEvent.filterChanged(
                              FigureFilter.emperors,
                            ),
                          ),
                        ),
                        _FigureFilterChip(
                          label: 'Scholars',
                          selected: selectedFilter == FigureFilter.scholars,
                          onTap: () => context.read<FiguresBloc>().add(
                            const FiguresEvent.filterChanged(
                              FigureFilter.scholars,
                            ),
                          ),
                        ),
                        _FigureFilterChip(
                          label: 'Revolutionaries',
                          selected:
                              selectedFilter == FigureFilter.revolutionaries,
                          onTap: () => context.read<FiguresBloc>().add(
                            const FiguresEvent.filterChanged(
                              FigureFilter.revolutionaries,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (filteredFigures.isEmpty)
                    const Padding(
                      padding: AppSpacing.pagePadding,
                      child: EmptyStateView(
                        title: 'No figures found',
                        message: 'Try another role or keyword.',
                      ),
                    )
                  else
                    Padding(
                      padding: AppSpacing.pagePadding,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredFigures.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.72,
                            ),
                        itemBuilder: (context, index) {
                          final figure = filteredFigures[index];
                          return FigureCard(
                            figure: figure,
                            onTap: () => context.push('/figures/${figure.id}'),
                          );
                        },
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

class _FigureFilterChip extends StatelessWidget {
  const _FigureFilterChip({
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
