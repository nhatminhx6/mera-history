import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.only(top: spacing.sm, bottom: spacing.lg),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing.md),
            child: const AppSectionHeader(title: 'Cá nhân'),
          ),
          SizedBox(height: spacing.md),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing.md),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.palette_outlined),
                title: const Text('Giao diện'),
                subtitle: const Text('Tùy chọn phong cách hiển thị'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/settings/theme'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(spacing.md, spacing.sm, spacing.md, 0),
            child: const Card(
              child: ListTile(
                leading: Icon(Icons.bookmark_outline),
                title: Text('Tổng mục đã lưu'),
                subtitle: Text('12 mục'),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(spacing.md, spacing.sm, spacing.md, 0),
            child: const Card(
              child: ListTile(
                leading: Icon(Icons.local_fire_department_outlined),
                title: Text('Chuỗi ngày đọc liên tiếp'),
                subtitle: Text('7 ngày'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
