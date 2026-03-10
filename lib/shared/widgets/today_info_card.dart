import 'package:flutter/material.dart';
import 'package:mera_history/core/utils/app_date_utils.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class TodayInfoCard extends StatelessWidget {
  const TodayInfoCard({
    super.key,
    required this.today,
    required this.lunarText,
    required this.canChi,
    required this.good,
    required this.avoid,
  });

  final DateTime today;
  final String lunarText;
  final String canChi;
  final String good;
  final String avoid;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppDateUtils.vietnameseDate(today),
              style: context.textTheme.titleLarge,
            ),
            SizedBox(height: spacing.xxs),
            Text('$lunarText - $canChi', style: context.textTheme.bodyMedium),
            SizedBox(height: spacing.xs),
            Text('Tốt cho: $good', style: context.textTheme.bodyMedium),
            SizedBox(height: spacing.xxs),
            Text('Nên tránh: $avoid', style: context.textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}
