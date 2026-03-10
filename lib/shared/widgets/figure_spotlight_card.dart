import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/data/models/hero_model.dart';

class FigureSpotlightCard extends StatelessWidget {
  const FigureSpotlightCard({
    super.key,
    required this.figure,
    required this.onTap,
  });

  final HeroModel figure;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(context.appRadius.xl),
              ),
              child: Image.network(
                figure.image,
                width: 120,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(spacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nhân vật hôm nay',
                      style: context.textTheme.labelLarge,
                    ),
                    SizedBox(height: spacing.xxs),
                    Text(figure.name, style: context.textTheme.titleLarge),
                    SizedBox(height: spacing.xxs),
                    Text(figure.role, style: context.textTheme.bodyMedium),
                    SizedBox(height: spacing.xs),
                    Text('Đọc câu chuyện', style: context.textTheme.labelLarge),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
