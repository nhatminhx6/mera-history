import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/calendar/models/lunar_day_info.dart';

class LunarDaySummaryCard extends StatelessWidget {
  const LunarDaySummaryCard({super.key, required this.info});

  final LunarDayInfo info;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.today_outlined, color: context.colorScheme.primary),
                SizedBox(width: spacing.xs),
                Text('Thông tin ngày', style: context.textTheme.titleLarge),
              ],
            ),
            SizedBox(height: spacing.sm),
            Text(info.solarDate, style: context.textTheme.titleMedium),
            SizedBox(height: spacing.xxs),
            Text(
              '${info.lunarDate} Âm lịch',
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: spacing.xs),
            Text(
              '${info.canChiDay} • ${info.truc} • ${info.nguHanh}',
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: spacing.xs),
            Text(
              'Đánh giá hôm nay: ${info.danhGiaNgay}',
              style: context.textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
