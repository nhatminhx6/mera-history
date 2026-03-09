import 'package:flutter/material.dart';
import 'package:mera_history/data/models/history_event_model.dart';

class HistoryEventCard extends StatelessWidget {
  const HistoryEventCard({super.key, required this.event, required this.onTap});

  final HistoryEventModel event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            event.image,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(event.title),
        subtitle: Text('${event.year} • ${event.country}'),
        onTap: onTap,
      ),
    );
  }
}
