import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class RandomDiscoveryCard extends StatelessWidget {
  const RandomDiscoveryCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onTap,
  });

  final String title;
  final String description;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius.xl),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.primary.withValues(alpha: 0.24),
              context.colorScheme.secondary.withValues(alpha: 0.16),
            ],
          ),
        ),
        padding: EdgeInsets.all(spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.textTheme.headlineSmall),
            SizedBox(height: spacing.xs),
            Text(description, style: context.textTheme.bodyMedium),
            SizedBox(height: spacing.sm),
            FilledButton.icon(
              onPressed: onTap,
              icon: const Icon(Icons.shuffle_rounded),
              label: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}
