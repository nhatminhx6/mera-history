import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/core/utils/app_date_utils.dart';
import 'package:mera_history/core/utils/lunar_calendar_utils.dart';
import 'package:mera_history/features/calendar/bloc/calendar_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';
import 'package:mera_history/shared/widgets/event_card.dart';
import 'package:mera_history/shared/widgets/unified_calendar_cell.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return SafeArea(
      child: BlocBuilder<CalendarBloc, CalendarState>(
        builder: (context, state) {
          if (state.error != null) {
            return EmptyStateView(
              title: 'Không thể tải lịch',
              message: state.error!,
              icon: Icons.error_outline,
            );
          }

          return ListView(
            padding: EdgeInsets.only(top: spacing.sm, bottom: spacing.lg),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.md),
                child: AppSectionHeader(
                  title: 'Lịch',
                  subtitle: AppDateUtils.vietnameseDate(state.selectedDay),
                ),
              ),
              SizedBox(height: spacing.sm),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.md),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(spacing.sm),
                    child: TableCalendar<void>(
                      focusedDay: state.focusedMonth,
                      firstDay: DateTime(1900),
                      lastDay: DateTime(2100),
                      calendarFormat: CalendarFormat.month,
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Tháng',
                      },
                      availableGestures: AvailableGestures.horizontalSwipe,
                      selectedDayPredicate: (day) =>
                          isSameDay(day, state.selectedDay),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                      ),
                      onDaySelected: (selected, focused) {
                        context.read<CalendarBloc>().add(
                          CalendarEvent.daySelected(selected),
                        );
                        context.read<CalendarBloc>().add(
                          CalendarEvent.monthChanged(focused),
                        );
                      },
                      onPageChanged: (focused) {
                        context.read<CalendarBloc>().add(
                          CalendarEvent.monthChanged(focused),
                        );
                      },
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) =>
                            _buildCell(
                              context,
                              state,
                              day,
                              false,
                              false,
                              false,
                            ),
                        todayBuilder: (context, day, focusedDay) =>
                            _buildCell(context, state, day, true, false, false),
                        selectedBuilder: (context, day, focusedDay) =>
                            _buildCell(context, state, day, false, true, false),
                        outsideBuilder: (context, day, focusedDay) =>
                            _buildCell(context, state, day, false, false, true),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacing.md),
              if (state.selectedDayInfo != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing.md),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(spacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppDateUtils.vietnameseDate(
                              state.selectedDayInfo!.solarDate,
                            ),
                            style: context.textTheme.titleLarge,
                          ),
                          SizedBox(height: spacing.xxs),
                          Text(
                            '${state.selectedDayInfo!.lunarDate} Âm lịch',
                            style: context.textTheme.bodyMedium,
                          ),
                          SizedBox(height: spacing.xxs),
                          Text(
                            state.selectedDayInfo!.canChi,
                            style: context.textTheme.bodyMedium,
                          ),
                          SizedBox(height: spacing.xs),
                          Text(
                            state.selectedDayInfo!.goodActivities,
                            style: context.textTheme.bodyMedium,
                          ),
                          SizedBox(height: spacing.xxs),
                          Text(
                            state.selectedDayInfo!.badActivities,
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(height: spacing.md),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.md),
                child: const AppSectionHeader(title: 'Sự kiện trong ngày'),
              ),
              SizedBox(height: spacing.xs),
              if (state.selectedEvents.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing.md),
                  child: const EmptyStateView(
                    title: 'Không có sự kiện',
                    message: 'Vui lòng chọn ngày khác để xem thêm.',
                  ),
                )
              else
                ...state.selectedEvents.map(
                  (event) => Padding(
                    padding: EdgeInsets.fromLTRB(
                      spacing.md,
                      0,
                      spacing.md,
                      spacing.sm,
                    ),
                    child: EventCard(
                      event: event,
                      onTap: () =>
                          context.push('/kham-pha/su-kien/${event.id}'),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCell(
    BuildContext context,
    CalendarState state,
    DateTime day,
    bool isToday,
    bool isSelected,
    bool isOutside,
  ) {
    final key = AppDateUtils.monthDay(day);
    final hasEvent = state.markers.any((m) => m.date == key);
    final hasSpecial = state.specialLunarDays.contains(key);
    final lunarText = LunarCalendarUtils.formatDayMonth(
      LunarCalendarUtils.solarToLunar(day),
    );

    return UnifiedCalendarCell(
      solarDay: day.day,
      lunarText: lunarText,
      isToday: isToday,
      isSelected: isSelected,
      isOutside: isOutside,
      hasEvent: hasEvent,
      hasSpecial: hasSpecial,
    );
  }
}
