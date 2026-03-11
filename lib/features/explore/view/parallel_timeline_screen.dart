import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/repository/explore_repository.dart';
import 'package:mera_history/features/explore/view/widgets/parallel_timeline_card.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';

class ParallelTimelineScreen extends StatelessWidget {
  const ParallelTimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = context.read<ExploreRepository>();
    final spacing = context.appSpacing;
    return Scaffold(
      appBar: AppBar(title: const Text('Dòng thời gian song song')),
      body: FutureBuilder(
        future: repository.getAllParallelTimelines(),
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
          final items = snapshot.data ?? const [];
          if (items.isEmpty) {
            return const EmptyStateView(
              title: 'Chưa có dữ liệu timeline',
              message: 'Vui lòng quay lại sau.',
            );
          }
          return ListView.separated(
            padding: EdgeInsets.all(spacing.md),
            itemCount: items.length,
            separatorBuilder: (context, index) => SizedBox(height: spacing.sm),
            itemBuilder: (context, index) =>
                ParallelTimelineCard(item: items[index]),
          );
        },
      ),
    );
  }
}
