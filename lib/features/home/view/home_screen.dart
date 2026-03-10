import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/features/home/bloc/home_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/daily_quiz_card.dart';
import 'package:mera_history/shared/widgets/dynasty_chip_list.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';
import 'package:mera_history/shared/widgets/featured_event_banner.dart';
import 'package:mera_history/shared/widgets/figure_spotlight_card.dart';
import 'package:mera_history/shared/widgets/popular_figure_card.dart';
import 'package:mera_history/shared/widgets/small_event_card.dart';
import 'package:mera_history/shared/widgets/today_info_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Scaffold(
      appBar: AppBar(
        title: const Text('MeraHistory'),
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => EmptyStateView(
              title: 'Không thể tải dữ liệu',
              message: message,
            ),
            loaded: (dashboard) {
              final featured = dashboard.featuredEvent;
              final figures = dashboard.featuredFigures;

              return ListView(
                padding: EdgeInsets.only(bottom: spacing.lg),
                children: [
                  if (featured != null)
                    Padding(
                      padding: EdgeInsets.all(spacing.md),
                      child: FeaturedEventBanner(
                        event: featured,
                        onTap: () =>
                            context.push('/kham-pha/su-kien/${featured.id}'),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: TodayInfoCard(
                      today: DateTime.now(),
                      lunarText: '20/1 Âm lịch',
                      canChi: 'Giáp Thìn - Ngày Hoàng Đạo',
                      good: 'Du lịch, Kinh doanh',
                      avoid: 'Xây dựng',
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: const AppSectionHeader(title: 'Sự kiện trong ngày'),
                  ),
                  SizedBox(height: spacing.xs),
                  SizedBox(
                    height: 210,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: spacing.md),
                      scrollDirection: Axis.horizontal,
                      itemCount: dashboard.todayEvents.take(3).length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: spacing.xs),
                      itemBuilder: (context, index) {
                        final event = dashboard.todayEvents[index];
                        return SmallEventCard(
                          event: event,
                          onTap: () =>
                              context.push('/kham-pha/su-kien/${event.id}'),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  if (figures.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: spacing.md),
                      child: FigureSpotlightCard(
                        figure: figures.first,
                        onTap: () => context.push(
                          '/kham-pha/nhan-vat/${figures.first.id}',
                        ),
                      ),
                    ),
                  SizedBox(height: spacing.lg),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: const AppSectionHeader(title: 'Khám phá lịch sử'),
                  ),
                  SizedBox(height: spacing.xs),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: const DynastyChipList(
                      items: [
                        'Cổ đại',
                        'Nhà Lý',
                        'Nhà Trần',
                        'Nhà Lê',
                        'Nhà Nguyễn',
                        'Việt Nam hiện đại',
                      ],
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: DailyQuizCard(
                      question: 'Ai là người đánh bại quân Thanh năm 1789?',
                      answers: const [
                        'A. Trần Hưng Đạo',
                        'B. Quang Trung',
                        'C. Lý Thường Kiệt',
                      ],
                      onAnswerTap: (index) {
                        final isCorrect = index == 1;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              isCorrect
                                  ? 'Chính xác! Đáp án: B. Quang Trung'
                                  : 'Chưa đúng, thử lại nhé.',
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: spacing.lg),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: spacing.md),
                    child: const AppSectionHeader(title: 'Nhân vật nổi bật'),
                  ),
                  SizedBox(height: spacing.xs),
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: spacing.md),
                      scrollDirection: Axis.horizontal,
                      itemCount: figures.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(width: spacing.xs),
                      itemBuilder: (context, index) {
                        final figure = figures[index];
                        return PopularFigureCard(
                          figure: figure,
                          onTap: () =>
                              context.push('/kham-pha/nhan-vat/${figure.id}'),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
