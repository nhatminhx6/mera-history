import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class LunarDirectionSection extends StatelessWidget {
  const LunarDirectionSection({super.key, required this.directions});

  final Map<String, String> directions;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.explore_outlined,
                  color: context.colorScheme.primary,
                ),
                SizedBox(width: spacing.xs),
                Text('Hướng xuất hành', style: context.textTheme.titleLarge),
              ],
            ),
            SizedBox(height: spacing.sm),
            ...directions.entries.map(
              (entry) => Padding(
                padding: EdgeInsets.only(bottom: spacing.xxs),
                child: Text(
                  '${entry.key}: ${entry.value}',
                  style: context.textTheme.bodyMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
