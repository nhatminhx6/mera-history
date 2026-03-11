import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/data/models/daily_advice.dart';
import 'package:mera_history/shared/widgets/daily_advice_item_row.dart';

class DailyAdviceCard extends StatelessWidget {
  const DailyAdviceCard({super.key, required this.advice});

  final DailyAdvice advice;

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
                Icon(Icons.auto_awesome, color: context.colorScheme.primary),
                SizedBox(width: spacing.xs),
                Text('Lời khuyên hôm nay', style: context.textTheme.titleLarge),
              ],
            ),
            SizedBox(height: spacing.sm),
            DailyAdviceItemRow(
              label: 'Công việc',
              text: advice.workAdvice,
              icon: Icons.work_outline,
            ),
            DailyAdviceItemRow(
              label: 'Giao tiếp',
              text: advice.communicationAdvice,
              icon: Icons.chat_bubble_outline,
            ),
            DailyAdviceItemRow(
              label: 'Tình cảm',
              text: advice.loveAdvice,
              icon: Icons.favorite_border,
            ),
            DailyAdviceItemRow(
              label: 'Tiền bạc',
              text: advice.moneyAdvice,
              icon: Icons.account_balance_wallet_outlined,
            ),
            DailyAdviceItemRow(
              label: 'Vận may',
              text: advice.luckAdvice,
              icon: Icons.star_border,
            ),
          ],
        ),
      ),
    );
  }
}
