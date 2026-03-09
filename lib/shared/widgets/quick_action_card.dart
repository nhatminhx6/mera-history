import 'package:flutter/material.dart';

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
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 28,
                color: Theme.of(context).colorScheme.primary,
              ),
              const Spacer(),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
