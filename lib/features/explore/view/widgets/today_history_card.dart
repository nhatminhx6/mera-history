import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/models/explore_hub_data.dart';

class TodayHistoryCard extends StatelessWidget {
  const TodayHistoryCard({super.key, required this.event, required this.onTap});

  final ExploreEventItem event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.md,
          vertical: spacing.xs,
        ),
        title: Text('${event.year} • ${event.title}'),
        subtitle: Text(
          event.summary,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
