import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/repository/explore_repository.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class KingDetailScreen extends StatelessWidget {
  const KingDetailScreen({super.key, required this.kingId});

  final String kingId;

  @override
  Widget build(BuildContext context) {
    final repository = context.read<ExploreRepository>();
    final spacing = context.appSpacing;
    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết vua')),
      body: FutureBuilder(
        future: repository.getKingById(kingId),
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
              title: 'Không tìm thấy vua',
              message: 'Vui lòng quay lại danh sách.',
            );
          }
          return ListView(
            padding: EdgeInsets.all(spacing.md),
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(context.appRadius.xl),
                child: Image.network(
                  item.image,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: spacing.md),
              Text(item.name, style: context.textTheme.headlineSmall),
              SizedBox(height: spacing.xxs),
              Text(item.dynastyName),
              SizedBox(height: spacing.xs),
              Text('Trị vì: ${item.reignStart} - ${item.reignEnd}'),
              SizedBox(height: spacing.md),
              Text(item.shortDescription, style: context.textTheme.bodyLarge),
            ],
          );
        },
      ),
    );
  }
}
