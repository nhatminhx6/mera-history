import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/data/models/hero_model.dart';

class PopularFigureCard extends StatelessWidget {
  const PopularFigureCard({
    super.key,
    required this.figure,
    required this.onTap,
  });

  final HeroModel figure;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SizedBox(
      width: 140,
      child: Card(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(spacing.sm),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundImage: NetworkImage(figure.image),
                ),
                SizedBox(height: spacing.xs),
                Text(
                  figure.name,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
