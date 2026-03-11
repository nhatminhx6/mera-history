import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/repository/explore_repository.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class BattleDetailScreen extends StatelessWidget {
  const BattleDetailScreen({super.key, required this.battleId});

  final String battleId;

  @override
  Widget build(BuildContext context) {
    final repository = context.read<ExploreRepository>();
    final spacing = context.appSpacing;
    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết trận đánh')),
      body: FutureBuilder(
        future: repository.getBattleById(battleId),
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
              title: 'Không tìm thấy trận đánh',
              message: 'Vui lòng quay lại danh sách.',
            );
          }
          return ListView(
            padding: EdgeInsets.all(spacing.md),
            children: [
              Text(item.name, style: context.textTheme.headlineSmall),
              SizedBox(height: spacing.xs),
              Text('${item.year} • ${item.location}'),
              SizedBox(height: spacing.xs),
              Text('Triều đại: ${item.dynastyName}'),
              SizedBox(height: spacing.sm),
              Text('Kết quả: ${item.result}'),
              SizedBox(height: spacing.md),
              Text(item.description, style: context.textTheme.bodyLarge),
              SizedBox(height: spacing.md),
              Text('Tướng chỉ huy', style: context.textTheme.titleMedium),
              SizedBox(height: spacing.xs),
              ...item.commanders.map((commander) => Text('- $commander')),
            ],
          );
        },
      ),
    );
  }
}
