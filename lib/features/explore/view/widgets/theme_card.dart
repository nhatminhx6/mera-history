import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/models/historical_theme.dart';
import 'package:mera_history/features/explore/view/widgets/explore_pressable.dart';

class ThemeCard extends StatelessWidget {
  const ThemeCard({super.key, required this.theme, required this.onTap});

  final HistoricalTheme theme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;
    return Card(
      child: ExplorePressable(
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
                theme.coverImage,
                height: 120,
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
                      Icon(
                        _iconData(theme.icon),
                        size: spacing.md,
                        color: context.colorScheme.primary,
                      ),
                      SizedBox(width: spacing.xs),
                      Expanded(
                        child: Text(
                          theme.title,
                          style: context.textTheme.titleMedium,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: spacing.xs),
                  Text(
                    theme.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _iconData(String icon) {
    return switch (icon) {
      'shield' => Icons.shield_outlined,
      'map' => Icons.map_outlined,
      'sports_martial_arts' => Icons.sports_martial_arts_outlined,
      'model_training' => Icons.account_tree_outlined,
      'handshake' => Icons.handshake_outlined,
      'alt_route' => Icons.alt_route_outlined,
      _ => Icons.auto_awesome_outlined,
    };
  }
}
