import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class AppStylePreviewCard extends StatelessWidget {
  const AppStylePreviewCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.background,
    required this.surface,
    required this.primary,
    required this.secondary,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool isSelected;
  final Color background;
  final Color surface;
  final Color primary;
  final Color secondary;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.xl),
        side: BorderSide(
          color: isSelected
              ? context.colorScheme.primary
              : context.colorScheme.outline,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius.xl),
        child: Padding(
          padding: EdgeInsets.all(spacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(title, style: context.textTheme.titleMedium),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check_circle,
                      color: context.colorScheme.primary,
                    ),
                ],
              ),
              SizedBox(height: spacing.xs),
              Text(subtitle, style: context.textTheme.bodySmall),
              SizedBox(height: spacing.sm),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(radius.lg),
                ),
                padding: EdgeInsets.all(spacing.xs),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: surface,
                          borderRadius: BorderRadius.circular(radius.md),
                        ),
                      ),
                    ),
                    SizedBox(width: spacing.xs),
                    Container(
                      width: 22,
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(radius.sm),
                      ),
                    ),
                    SizedBox(width: spacing.xxs),
                    Container(
                      width: 22,
                      decoration: BoxDecoration(
                        color: secondary,
                        borderRadius: BorderRadius.circular(radius.sm),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
