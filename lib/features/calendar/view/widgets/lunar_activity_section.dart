import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class LunarActivitySection extends StatelessWidget {
  const LunarActivitySection({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<String> items;

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
                Icon(icon, color: context.colorScheme.primary),
                SizedBox(width: spacing.xs),
                Text(title, style: context.textTheme.titleLarge),
              ],
            ),
            SizedBox(height: spacing.sm),
            ...items.map(
              (item) => Padding(
                padding: EdgeInsets.only(bottom: spacing.xxs),
                child: Row(
                  children: [
                    Icon(
                      Icons.fiber_manual_record,
                      size: spacing.xs,
                      color: context.colorScheme.primary,
                    ),
                    SizedBox(width: spacing.xs),
                    Expanded(
                      child: Text(item, style: context.textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
