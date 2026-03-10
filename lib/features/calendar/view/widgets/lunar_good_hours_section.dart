import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class LunarGoodHoursSection extends StatelessWidget {
  const LunarGoodHoursSection({super.key, required this.hours});

  final List<String> hours;

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
                Icon(Icons.schedule, color: context.colorScheme.primary),
                SizedBox(width: spacing.xs),
                Text('Giờ hoàng đạo', style: context.textTheme.titleLarge),
              ],
            ),
            SizedBox(height: spacing.sm),
            ...hours.map(
              (hour) => Padding(
                padding: EdgeInsets.only(bottom: spacing.xxs),
                child: Text(hour, style: context.textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
