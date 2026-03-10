import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/data/models/hero_model.dart';

class FigureCard extends StatelessWidget {
  const FigureCard({
    super.key,
    required this.figure,
    required this.onTap,
    this.compact = false,
  });

  final HeroModel figure;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(radius.xl),
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(radius.xl),
                ),
                child: Image.network(
                  figure.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(spacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    figure.name,
                    style: context.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: spacing.xxs),
                  Text(figure.period, style: context.textTheme.bodySmall),
                  if (!compact) ...[
                    SizedBox(height: spacing.xxs),
                    Text(figure.role, style: context.textTheme.bodySmall),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
