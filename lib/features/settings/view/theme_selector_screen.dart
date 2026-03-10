import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mera_history/core/theme/app_style.dart';
import 'package:mera_history/core/theme/app_theme_cubit.dart';
import 'package:mera_history/core/theme/app_theme_state.dart';
import 'package:mera_history/core/theme/color_palettes.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/shared/widgets/app_style_preview_card.dart';

class ThemeSelectorScreen extends StatelessWidget {
  const ThemeSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme SelectorScreen')),
      body: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          final spacing = context.appSpacing;

          return ListView(
            padding: EdgeInsets.all(spacing.md),
            children: [
              Text('Choose App Style', style: context.textTheme.headlineSmall),
              SizedBox(height: spacing.xs),
              Text(
                'Switch visual style instantly across the entire app.',
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(height: spacing.lg),
              ...AppStyle.values.map(
                (style) => Padding(
                  padding: EdgeInsets.only(bottom: spacing.sm),
                  child: _styleCard(context, state, style),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _styleCard(BuildContext context, AppThemeState state, AppStyle style) {
    final palette = paletteForStyle(style);

    final title = switch (style) {
      AppStyle.darkImperial => 'Dark Imperial',
      AppStyle.darkJade => 'Dark Jade',
      AppStyle.darkScholar => 'Dark Scholar',
      AppStyle.ancientBronze => 'Ancient Bronze',
      AppStyle.darkCrimson => 'Dark Crimson',
      AppStyle.midnightBlue => 'Midnight Blue',
      AppStyle.obsidianGold => 'Obsidian Gold',
      AppStyle.deepForest => 'Deep Forest',
    };

    final subtitle = switch (style) {
      AppStyle.darkImperial => 'Imperial gold and crimson contrast',
      AppStyle.darkJade => 'Calm jade surfaces and warm accents',
      AppStyle.darkScholar => 'Scholarly blues with strong hierarchy',
      AppStyle.ancientBronze => 'Historical bronze manuscript tone',
      AppStyle.darkCrimson => 'Deep crimson editorial atmosphere',
      AppStyle.midnightBlue => 'Night archive with vibrant blue focus',
      AppStyle.obsidianGold => 'Obsidian base with gold highlights',
      AppStyle.deepForest => 'Forest palette with muted gold details',
    };

    return AppStylePreviewCard(
      title: title,
      subtitle: subtitle,
      isSelected: state.style == style,
      background: palette.background,
      surface: palette.surfaceContainer,
      primary: palette.primary,
      secondary: palette.secondary,
      onTap: () => context.read<AppThemeCubit>().changeStyle(style),
    );
  }
}
