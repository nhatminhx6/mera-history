import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/repository/explore_repository.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class ThemeDetailScreen extends StatelessWidget {
  const ThemeDetailScreen({super.key, required this.themeId});

  final String themeId;

  @override
  Widget build(BuildContext context) {
    final repository = context.read<ExploreRepository>();
    final spacing = context.appSpacing;
    return Scaffold(
      appBar: AppBar(title: const Text('Chủ đề lịch sử')),
      body: FutureBuilder(
        future: repository.getThemeById(themeId),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return EmptyStateView(
              title: 'Không thể tải dữ liệu',
              message: snapshot.error.toString(),
              icon: Icons.error_outline,
            );
          }
          final item = snapshot.data;
          if (item == null) {
            return const EmptyStateView(
              title: 'Không tìm thấy chủ đề',
              message: 'Vui lòng quay lại danh sách.',
            );
          }
          return ListView(
            padding: EdgeInsets.all(spacing.md),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(context.appRadius.xl),
                child: Image.network(
                  item.coverImage,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: spacing.md),
              Text(item.title, style: context.textTheme.headlineSmall),
              SizedBox(height: spacing.sm),
              Text(item.description, style: context.textTheme.bodyLarge),
            ],
          );
        },
      ),
    );
  }
}
