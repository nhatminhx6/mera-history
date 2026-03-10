import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/data/models/history_event_model.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.event,
    required this.onTap,
    this.featured = false,
  });

  final HistoryEventModel event;
  final VoidCallback onTap;
  final bool featured;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;
    final imageHeight = featured ? 180.0 : 120.0;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(radius.xl),
              ),
              child: Image.network(
                event.image,
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(spacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(label: Text('${event.year}')),
                      SizedBox(width: spacing.xs),
                      Expanded(
                        child: Text(
                          event.country,
                          style: context.textTheme.bodyMedium,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: spacing.sm,
                        color: context.colorScheme.primary,
                      ),
                    ],
                  ),
                  SizedBox(height: spacing.xs),
                  Text(event.title, style: context.textTheme.titleLarge),
                  SizedBox(height: spacing.xs),
                  Text(
                    event.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodyMedium,
                  ),
                  SizedBox(height: spacing.sm),
                  Text(
                    'Đọc câu chuyện',
                    style: context.textTheme.labelLarge?.copyWith(
                      color: context.colorScheme.primary,
                    ),
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
