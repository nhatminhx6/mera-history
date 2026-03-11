import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class DailyAdviceItemRow extends StatelessWidget {
  const DailyAdviceItemRow({
    super.key,
    required this.label,
    required this.text,
    this.icon,
  });

  final String label;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Padding(
      padding: EdgeInsets.only(bottom: spacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon ?? Icons.circle,
            size: icon == null ? spacing.xxs : spacing.sm,
            color: context.colorScheme.primary,
          ),
          SizedBox(width: spacing.xs),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: context.textTheme.labelLarge),
                SizedBox(height: spacing.xxs / 2),
                Text(text, style: context.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
