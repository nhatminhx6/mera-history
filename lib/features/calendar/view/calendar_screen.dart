import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mera_history/core/constants/app_spacing.dart';
import 'package:mera_history/core/utils/app_date_utils.dart';
import 'package:mera_history/features/calendar/bloc/calendar_bloc.dart';
import 'package:mera_history/shared/widgets/app_section_header.dart';
import 'package:mera_history/shared/widgets/empty_state_view.dart';
import 'package:mera_history/shared/widgets/event_card.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.only(top: 12, bottom: 24),
            children: [
              Padding(
                padding: AppSpacing.pagePadding,
                child: AppSectionHeader(
                  title: 'Calendar',
                  subtitle: DateFormat(
                    'EEEE, dd MMM yyyy',
                  ).format(state.selectedDay),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: AppSpacing.pagePadding,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: TableCalendar<void>(
                      focusedDay: state.focusedMonth,
                      firstDay: DateTime(1900),
                      lastDay: DateTime(2100),
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
                        markerBuilder: (context, day, focusedDay) {
                          final key = AppDateUtils.monthDay(day);
                          final hasEvent = state.markers.any(
                            (m) => m.date == key,
                          );
                          final hasLunarSpecial = state.specialLunarDays
                              .contains(key);
                          if (!hasEvent && !hasLunarSpecial) {
                            return const SizedBox();
                          }
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (hasEvent)
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              if (hasEvent && hasLunarSpecial)
                                const SizedBox(width: 3),
                              if (hasLunarSpecial)
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.tertiary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (state.selectedDayInfo != null)
                Padding(
                  padding: AppSpacing.pagePadding,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selected date details',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Solar: ${DateFormat('dd/MM/yyyy').format(state.selectedDayInfo!.solarDate)}',
                          ),
                          Text('Lunar: ${state.selectedDayInfo!.lunarDate}'),
                          Text('Can Chi: ${state.selectedDayInfo!.canChi}'),
                          const SizedBox(height: 8),
                          Text(state.selectedDayInfo!.goodActivities),
                          Text(state.selectedDayInfo!.badActivities),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              Padding(
                padding: AppSpacing.pagePadding,
                child: const AppSectionHeader(title: 'Historical Events'),
              ),
              const SizedBox(height: 10),
              if (state.selectedEvents.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: EmptyStateView(
                    title: 'No events for this day',
                    message: 'Try a different day in this month.',
                  ),
                )
              else
                ...state.selectedEvents.map(
                  (event) => Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
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
