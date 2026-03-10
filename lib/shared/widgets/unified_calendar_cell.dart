import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';

class UnifiedCalendarCell extends StatelessWidget {
  const UnifiedCalendarCell({
    super.key,
    required this.solarDay,
    required this.lunarText,
    required this.isToday,
    required this.isSelected,
    required this.isOutside,
    required this.hasEvent,
    required this.hasSpecial,
  });

  final int solarDay;
  final String lunarText;
  final bool isToday;
  final bool isSelected;
  final bool isOutside;
  final bool hasEvent;
  final bool hasSpecial;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: spacing.xxs,
        horizontal: spacing.xxs / 2,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? context.colorScheme.primary.withValues(alpha: 0.18)
            : (isToday
                  ? context.colorScheme.secondary.withValues(alpha: 0.16)
                  : null),
        borderRadius: BorderRadius.circular(context.appRadius.sm + 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$solarDay',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: isOutside
                  ? context.appColors.textSecondary
                  : context.appColors.textPrimary,
            ),
          ),
          SizedBox(height: spacing.xxs / 2),
          Text(
            lunarText,
            style: context.textTheme.bodySmall?.copyWith(
              color: context.appColors.lunarText.withValues(
                alpha: isOutside ? 0.6 : 0.95,
              ),
              fontSize: 11,
            ),
          ),
          SizedBox(height: spacing.xxs / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (hasEvent)
                Container(
                  width: spacing.xxs,
                  height: spacing.xxs,
                  decoration: BoxDecoration(
                    color: context.appColors.eventDot,
                    shape: BoxShape.circle,
                  ),
                ),
              if (hasEvent && hasSpecial) SizedBox(width: spacing.xxs / 2),
              if (hasSpecial)
                Container(
                  width: spacing.xxs,
                  height: spacing.xxs,
                  decoration: BoxDecoration(
                    color: context.appColors.specialDayBadge,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
