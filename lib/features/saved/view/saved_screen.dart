import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/constants/app_spacing.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/saved/bloc/saved_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<SavedBloc, SavedState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => EmptyStateView(
              title: 'Cannot load saved content',
              message: message,
              icon: Icons.error_outline,
            ),
            loaded: (events, figures, readingHistory) {
              return ListView(
                padding: EdgeInsets.only(
                  top: context.appSpacing.sm,
                  bottom: context.appSpacing.lg,
                ),
                children: [
                  const Padding(
                    padding: AppSpacing.pagePadding,
                    child: AppSectionHeader(title: 'Saved'),
                  ),
                  AppSpacing.sectionGap,
                  const Padding(
                    padding: AppSpacing.pagePadding,
                    child: AppSectionHeader(title: 'Saved Events'),
                  ),
                  const SizedBox(height: 10),
                  if (events.isEmpty)
                    const Padding(
                      padding: AppSpacing.pagePadding,
                      child: EmptyStateView(
                        title: 'No saved events',
                        message: 'Bookmark stories to see them here.',
                        icon: Icons.bookmark_outline,
                      ),
                    ),
                  AppSpacing.sectionGap,
                  const Padding(
                    padding: AppSpacing.pagePadding,
                    child: AppSectionHeader(title: 'Saved Figures'),
                  ),
                  const SizedBox(height: 10),
                  if (figures.isEmpty)
                    const Padding(
                      padding: AppSpacing.pagePadding,
                      child: EmptyStateView(
                        title: 'No saved figures',
                        message: 'Save historical figures for quick revisit.',
                        icon: Icons.account_balance_outlined,
                      ),
                    ),
                  AppSpacing.sectionGap,
                  const Padding(
                    padding: AppSpacing.pagePadding,
                    child: AppSectionHeader(title: 'Reading History'),
                  ),
                  const SizedBox(height: 10),
                  ...readingHistory.map(
                    (item) => Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                      child: Card(
                        child: ListTile(
                          title: Text(item.title),
                          subtitle: Text(item.time),
                        ),
                      ),
                    ),
                  ),
                  AppSpacing.sectionGap,
                  Padding(
                    padding: AppSpacing.pagePadding,
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.palette_outlined,
                          color: context.colorScheme.primary,
                        ),
                        title: const Text('Theme & Style'),
                        subtitle: const Text('Switch app visual style'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => context.push('/settings/theme'),
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
