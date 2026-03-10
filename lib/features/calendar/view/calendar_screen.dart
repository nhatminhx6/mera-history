import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mera_history/core/theme/theme_extensions.dart';
import 'package:mera_history/core/utils/app_date_utils.dart';
import 'package:mera_history/core/utils/lunar_calendar_utils.dart';
import 'package:mera_history/features/calendar/bloc/calendar_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';
import 'package:mera_history/shared/widgets/event_card.dart';
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
              title: 'Calendar unavailable',
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
                  title: 'Calendar',
                  subtitle: DateFormat(
                    'EEEE, dd MMM yyyy',
                  ).format(state.selectedDay),
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
                        CalendarFormat.month: 'Month',
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
                            _CalendarDayCell(
                              day: day,
                              isSelected: false,
                              isToday: false,
                              isOutside: false,
                              hasEvent: state.markers.any(
                                (m) => m.date == AppDateUtils.monthDay(day),
                              ),
                              hasLunarSpecial: state.specialLunarDays.contains(
                                AppDateUtils.monthDay(day),
                              ),
                            ),
                        todayBuilder: (context, day, focusedDay) =>
                            _CalendarDayCell(
                              day: day,
                              isSelected: false,
                              isToday: true,
                              isOutside: false,
                              hasEvent: state.markers.any(
                                (m) => m.date == AppDateUtils.monthDay(day),
                              ),
                              hasLunarSpecial: state.specialLunarDays.contains(
                                AppDateUtils.monthDay(day),
                              ),
                            ),
                        selectedBuilder: (context, day, focusedDay) =>
                            _CalendarDayCell(
                              day: day,
                              isSelected: true,
                              isToday: false,
                              isOutside: false,
                              hasEvent: state.markers.any(
                                (m) => m.date == AppDateUtils.monthDay(day),
                              ),
                              hasLunarSpecial: state.specialLunarDays.contains(
                                AppDateUtils.monthDay(day),
                              ),
                            ),
                        outsideBuilder: (context, day, focusedDay) =>
                            _CalendarDayCell(
                              day: day,
                              isSelected: false,
                              isToday: false,
                              isOutside: true,
                              hasEvent: state.markers.any(
                                (m) => m.date == AppDateUtils.monthDay(day),
                              ),
                              hasLunarSpecial: state.specialLunarDays.contains(
                                AppDateUtils.monthDay(day),
                              ),
                            ),
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
                            'Selected date details',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: spacing.xs + spacing.xxs / 2),
                          Text(
                            'Solar: ${DateFormat('dd/MM/yyyy').format(state.selectedDayInfo!.solarDate)}',
                          ),
                          Text('Lunar: ${state.selectedDayInfo!.lunarDate}'),
                          Text('Can Chi: ${state.selectedDayInfo!.canChi}'),
                          SizedBox(height: spacing.xs),
                          Text(state.selectedDayInfo!.goodActivities),
                          Text(state.selectedDayInfo!.badActivities),
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(height: spacing.md),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: spacing.md),
                child: const AppSectionHeader(title: 'Historical Events'),
              ),
              SizedBox(height: spacing.xs + spacing.xxs / 2),
              if (state.selectedEvents.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing.md),
                  child: EmptyStateView(
                    title: 'No events for this day',
                    message: 'Try a different day in this month.',
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
                      onTap: () => context.push('/history/detail/${event.id}'),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _CalendarDayCell extends StatelessWidget {
  const _CalendarDayCell({
    required this.day,
    required this.isSelected,
    required this.isToday,
    required this.isOutside,
    required this.hasEvent,
    required this.hasLunarSpecial,
  });

  final DateTime day;
  final bool isSelected;
  final bool isToday;
  final bool isOutside;
  final bool hasEvent;
  final bool hasLunarSpecial;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final radius = context.appRadius;
    final lunar = LunarCalendarUtils.solarToLunar(day);
    final lunarText = LunarCalendarUtils.formatDayMonth(lunar);

    final isHighlighted = isSelected || isToday;
    final foregroundColor = isOutside
        ? context.appColors.textSecondary
        : context.appColors.textPrimary;

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
        borderRadius: BorderRadius.circular(radius.sm + 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${day.day}',
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: isHighlighted ? FontWeight.w700 : FontWeight.w600,
              color: foregroundColor,
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
              if (hasEvent && hasLunarSpecial) SizedBox(width: spacing.xxs / 2),
              if (hasLunarSpecial)
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
