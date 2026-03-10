import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class DailyQuizCard extends StatelessWidget {
  const DailyQuizCard({
    super.key,
    required this.question,
    required this.answers,
    required this.onAnswerTap,
  });

  final String question;
  final List<String> answers;
  final ValueChanged<int> onAnswerTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Card(
      child: Padding(
        padding: EdgeInsets.all(spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Câu hỏi hôm nay', style: context.textTheme.titleLarge),
            SizedBox(height: spacing.xs),
            Text(question, style: context.textTheme.bodyLarge),
            SizedBox(height: spacing.sm),
            ...answers.asMap().entries.map(
              (entry) => Padding(
                padding: EdgeInsets.only(bottom: spacing.xs),
                child: OutlinedButton(
                  onPressed: () => onAnswerTap(entry.key),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(entry.value),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
