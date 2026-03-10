import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/data/models/history_event_model.dart';

class FeaturedEventBanner extends StatelessWidget {
  const FeaturedEventBanner({
    super.key,
    required this.event,
    required this.onTap,
  });

  final HistoryEventModel event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius.xl),
        child: Stack(
          children: [
            SizedBox(
              height: 260,
              width: double.infinity,
              child: Image.network(event.image, fit: BoxFit.cover),
            ),
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
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
              left: spacing.md,
              right: spacing.md,
              bottom: spacing.md,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HÔM NAY TRONG LỊCH SỬ',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: spacing.xxs),
                  Text(
                    '${event.year}',
                    style: context.textTheme.displayLarge?.copyWith(
                      color: context.appColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: spacing.xxs),
                  Text(
                    event.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.appColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: spacing.xxs),
                  Text(
                    event.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.appColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: spacing.sm),
                  FilledButton(
                    onPressed: onTap,
                    child: const Text('Xem chi tiết'),
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
