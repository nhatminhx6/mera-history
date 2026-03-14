import 'package:flutter/material.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/explore/models/battle.dart';
import 'package:mera_history/features/explore/view/widgets/explore_pressable.dart';

class BattleCard extends StatelessWidget {
  const BattleCard({super.key, required this.battle, required this.onTap});

  final Battle battle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return SizedBox(
      width: 280,
      child: Card(
        child: ExplorePressable(
          onTap: onTap,
          borderRadius: BorderRadius.circular(context.appRadius.xl),
          child: Padding(
            padding: EdgeInsets.all(spacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(battle.name, style: context.textTheme.titleMedium),
                SizedBox(height: spacing.xxs),
                Text(
                  '${battle.year} • ${battle.location}',
                  style: context.textTheme.bodySmall,
                ),
                SizedBox(height: spacing.xs),
                Text(
                  battle.result,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
