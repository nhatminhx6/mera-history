import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/models/explore_hub_data.dart';
import 'package:mera_history/features/explore/view/widgets/explore_pressable.dart';

class ExploreFigureCard extends StatelessWidget {
  const ExploreFigureCard({
    super.key,
    required this.figure,
    required this.onTap,
  });

  final ExploreFigure figure;
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
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(radius.xl),
                ),
                child: Image.network(
                  figure.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
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
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: spacing.xxs),
                  Text(figure.role, style: context.textTheme.bodySmall),
                  SizedBox(height: spacing.xxs),
                  Text(figure.period, style: context.textTheme.labelSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
