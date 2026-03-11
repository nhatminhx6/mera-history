import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/models/dynasty.dart';

class TimelinePeriodCard extends StatelessWidget {
  const TimelinePeriodCard({
    super.key,
    required this.dynasty,
    required this.onTap,
  });

  final Dynasty dynasty;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return SizedBox(
      width: 220,
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(context.appRadius.xl),
          child: Padding(
            padding: EdgeInsets.all(spacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dynasty.name, style: context.textTheme.titleMedium),
                SizedBox(height: spacing.xxs),
                Text(
                  '${dynasty.startYear} - ${dynasty.endYear}',
                  style: context.textTheme.labelMedium,
                ),
                SizedBox(height: spacing.xs),
                Text(
                  dynasty.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
