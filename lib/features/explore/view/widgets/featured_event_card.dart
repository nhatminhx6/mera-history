import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/models/explore_hub_data.dart';

class FeaturedEventCard extends StatelessWidget {
  const FeaturedEventCard({
    super.key,
    required this.event,
    required this.onTap,
  });

  final ExploreEventItem event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(radius.xl),
                  ),
                  child: Image.network(
                    event.image,
                    width: double.infinity,
                    height: 210,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(radius.xl),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          context.appColors.heroOverlayStart,
                          context.appColors.heroOverlayEnd,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: spacing.sm,
                  right: spacing.sm,
                  bottom: spacing.sm,
                  child: Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.appColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(spacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: spacing.xs,
                    runSpacing: spacing.xs,
                    children: [
                      Chip(label: Text('${event.year}')),
                      Chip(label: Text(event.context)),
                    ],
                  ),
                  SizedBox(height: spacing.xs),
                  Text(
                    event.summary,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium,
                  ),
                  SizedBox(height: spacing.xs),
                  Row(
                    children: [
                      Text(
                        'Đọc câu chuyện',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: context.colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: spacing.xxs),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: spacing.md,
                        color: context.colorScheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
