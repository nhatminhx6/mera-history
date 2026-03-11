import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/models/dynasty.dart';

class DynastyCard extends StatelessWidget {
  const DynastyCard({super.key, required this.dynasty, required this.onTap});

  final Dynasty dynasty;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return SizedBox(
      width: 250,
      child: Card(
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(context.appRadius.xl),
          child: Padding(
            padding: EdgeInsets.all(spacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dynasty.name, style: context.textTheme.titleMedium),
                SizedBox(height: spacing.xxs),
                Text('${dynasty.startYear} - ${dynasty.endYear}'),
                SizedBox(height: spacing.xxs),
                Text(
                  'Kinh đô: ${dynasty.capital}',
                  style: context.textTheme.bodySmall,
                ),
                SizedBox(height: spacing.xs),
                Text(
                  dynasty.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
