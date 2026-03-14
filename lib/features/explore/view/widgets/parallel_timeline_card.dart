import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/models/parallel_timeline_item.dart';

class ParallelTimelineCard extends StatelessWidget {
  const ParallelTimelineCard({super.key, required this.item});

  final ParallelTimelineItem item;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return SizedBox(
      width: 320,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(spacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.history_toggle_off_rounded,
                    color: context.colorScheme.primary,
                    size: spacing.md,
                  ),
                  SizedBox(width: spacing.xs),
                  Text(
                    'Năm ${_formatYear(item.year)}',
                    style: context.textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(height: spacing.xs),
              _Block(title: 'Việt Nam', content: item.vietnam),
              _Block(title: 'Trung Quốc', content: item.china),
              _Block(title: 'Thế giới', content: item.world),
              _Block(title: 'Hệ quả', content: item.impact),
            ],
          ),
        ),
      ),
    );
  }

  String _formatYear(int year) {
    if (year < 0) return '${year.abs()} TCN';
    return '$year';
  }
}

class _Block extends StatelessWidget {
  const _Block({required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return Padding(
      padding: EdgeInsets.only(bottom: spacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme.labelLarge),
          SizedBox(height: spacing.xxs),
          Text(
            content,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
