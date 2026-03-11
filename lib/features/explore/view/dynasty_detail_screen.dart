import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/repository/explore_repository.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class DynastyDetailScreen extends StatelessWidget {
  const DynastyDetailScreen({super.key, required this.dynastyId});

  final String dynastyId;

  @override
  Widget build(BuildContext context) {
    final repository = context.read<ExploreRepository>();
    final spacing = context.appSpacing;
    return Scaffold(
      appBar: AppBar(title: const Text('Chi tiết triều đại')),
      body: FutureBuilder(
        future: repository.getDynastyById(dynastyId),
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
              title: 'Không tìm thấy triều đại',
              message: 'Vui lòng quay lại danh sách.',
            );
          }
          return ListView(
            padding: EdgeInsets.all(spacing.md),
            children: [
              Text(item.name, style: context.textTheme.headlineSmall),
              SizedBox(height: spacing.xs),
              Text('${item.startYear} - ${item.endYear}'),
              SizedBox(height: spacing.xs),
              Text('Kinh đô: ${item.capital}'),
              SizedBox(height: spacing.md),
              Text(item.description, style: context.textTheme.bodyLarge),
              SizedBox(height: spacing.md),
              Text('Bối cảnh Trung Quốc', style: context.textTheme.titleMedium),
              SizedBox(height: spacing.xs),
              Text(item.chinaContext),
              SizedBox(height: spacing.md),
              Text('Di sản', style: context.textTheme.titleMedium),
              SizedBox(height: spacing.xs),
              Text(item.legacy),
            ],
          );
        },
      ),
    );
  }
}
