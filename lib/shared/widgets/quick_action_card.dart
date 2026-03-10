import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(radius.xl),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(spacing.sm),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: spacing.xl - spacing.xxs,
                color: context.colorScheme.primary,
              ),
              const Spacer(),
              Text(title, style: context.textTheme.titleMedium, maxLines: 2),
            ],
          ),
        ),
      ),
    );
  }
}
