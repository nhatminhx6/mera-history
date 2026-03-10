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
      appBar: AppBar(title: const Text('Chọn giao diện')),
      body: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          final spacing = context.appSpacing;

          return ListView(
            padding: EdgeInsets.all(spacing.md),
            children: [
              Text(
                'Chọn phong cách hiển thị',
                style: context.textTheme.headlineSmall,
              ),
              SizedBox(height: spacing.xs),
              Text(
                'Thay đổi giao diện toàn ứng dụng ngay lập tức.',
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
      AppStyle.darkImperial => 'Đế Vương Huyền',
      AppStyle.darkJade => 'Ngọc Thẫm',
      AppStyle.darkScholar => 'Học Giả Đêm',
      AppStyle.ancientBronze => 'Đồng Cổ',
      AppStyle.darkCrimson => 'Đỏ Thẫm',
      AppStyle.midnightBlue => 'Lam Đêm',
      AppStyle.obsidianGold => 'Hắc Kim',
      AppStyle.deepForest => 'Rừng Sâu',
    };

    final subtitle = switch (style) {
      AppStyle.darkImperial => 'Sắc vàng cổ điển và đỏ quyền uy',
      AppStyle.darkJade => 'Nền ngọc trầm, điểm nhấn ấm',
      AppStyle.darkScholar => 'Tông lam học thuật, tương phản rõ',
      AppStyle.ancientBronze => 'Không khí tư liệu đồng cổ',
      AppStyle.darkCrimson => 'Sắc đỏ thẫm giàu cảm xúc',
      AppStyle.midnightBlue => 'Kho tư liệu đêm với điểm nhấn lam',
      AppStyle.obsidianGold => 'Nền hắc diện thạch, ánh kim sang trọng',
      AppStyle.deepForest => 'Tông rừng sâu kết hợp ánh vàng nhẹ',
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
