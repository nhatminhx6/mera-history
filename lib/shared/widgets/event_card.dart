import 'package:flutter/material.dart';
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
    final imageHeight = featured ? 180.0 : 120.0;

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: Image.network(
                event.image,
                height: imageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Chip(label: Text('${event.year}')),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          event.country,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Read story',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
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
