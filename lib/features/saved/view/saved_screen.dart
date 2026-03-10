import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/saved/bloc/saved_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SafeArea(
      child: BlocBuilder<SavedBloc, SavedState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => EmptyStateView(
              title: 'Không thể tải dữ liệu',
              message: message,
              icon: Icons.error_outline,
            ),
            loaded: (events, figures, readingHistory) {
              return ListView(
                padding: EdgeInsets.only(top: spacing.sm, bottom: spacing.lg),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: const AppSectionHeader(title: 'Đã lưu'),
                  ),
                  SizedBox(height: spacing.lg),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: const AppSectionHeader(title: 'Sự kiện đã lưu'),
                  ),
                  SizedBox(height: spacing.xs),
                  if (events.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacing.md),
                      child: const EmptyStateView(
                        title: 'Chưa có sự kiện đã lưu',
                        message: 'Nhấn lưu khi đọc để xem lại sau.',
                        icon: Icons.bookmark_outline,
                      ),
                    ),
                  SizedBox(height: spacing.lg),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: const AppSectionHeader(title: 'Nhân vật đã lưu'),
                  ),
                  SizedBox(height: spacing.xs),
                  if (figures.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacing.md),
                      child: const EmptyStateView(
                        title: 'Chưa có nhân vật đã lưu',
                        message: 'Lưu nhân vật để xem lại nhanh hơn.',
                        icon: Icons.account_balance_outlined,
                      ),
                    ),
                  SizedBox(height: spacing.lg),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: const AppSectionHeader(title: 'Lịch sử đọc'),
                  ),
                  SizedBox(height: spacing.xs),
                  ...readingHistory.map(
                    (item) => Padding(
                      padding: EdgeInsets.fromLTRB(
                        spacing.md,
                        0,
                        spacing.md,
                        spacing.sm,
                      ),
                      child: Card(
                        child: ListTile(
                          title: Text(item.title),
                          subtitle: Text(item.time),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: spacing.md),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.palette_outlined),
                        title: const Text('Đổi giao diện'),
                        subtitle: const Text('Tùy chỉnh phong cách hiển thị'),
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
