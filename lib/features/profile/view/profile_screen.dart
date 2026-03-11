import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/profile/bloc/profile_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SafeArea(
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => EmptyStateView(
              title: 'Không thể tải hồ sơ',
              message: message,
              icon: Icons.error_outline,
            ),
            loaded: (overview) => ListView(
              padding: EdgeInsets.only(top: spacing.sm, bottom: spacing.lg),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing.md),
                  child: AppSectionHeader(
                    title: 'Cá nhân',
                    subtitle: overview.displayName,
                  ),
                ),
                SizedBox(height: spacing.md),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing.md),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.palette_outlined),
                      title: const Text('Giao diện'),
                      subtitle: Text(
                        'Phong cách hiện tại: ${overview.themeLabel}',
                      ),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () => context.push('/settings/theme'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    spacing.md,
                    spacing.sm,
                    spacing.md,
                    0,
                  ),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.bookmark_outline),
                      title: const Text('Tổng mục đã lưu'),
                      subtitle: Text('${overview.bookmarkCount} mục'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    spacing.md,
                    spacing.sm,
                    spacing.md,
                    0,
                  ),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.local_fire_department_outlined),
                      title: const Text('Chuỗi ngày đọc liên tiếp'),
                      subtitle: Text('${overview.readingStreak} ngày'),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    spacing.md,
                    spacing.sm,
                    spacing.md,
                    0,
                  ),
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.access_time_outlined),
                      title: const Text('Hoạt động gần nhất'),
                      subtitle: Text(overview.lastActive),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
