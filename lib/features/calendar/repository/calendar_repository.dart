import 'package:mera_history/core/utils/app_date_utils.dart';
import 'package:mera_history/core/utils/lunar_calendar_utils.dart';
import 'package:mera_history/data/repositories/calendar_data_repository.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';
import 'package:mera_history/features/calendar/models/calendar_models.dart';

abstract class CalendarRepository {
  Future<CalendarPayload> loadCalendarPayload();
  Future<CalendarSelectionResult> loadDay(DateTime day);
}

class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl({
    required this.calendarData,
    required this.historyData,
  });

  final CalendarDataRepository calendarData;
  final HistoryDataRepository historyData;

  @override
  Future<CalendarSelectionResult> loadDay(DateTime day) async {
    final key = AppDateUtils.monthDay(day);
    final allEvents = await historyData.getAll();
    final events = allEvents.where((e) => e.date == key).toList();

    final dayInfo = CalendarDayInfo(
      solarDate: day,
      lunarDate: LunarCalendarUtils.formatDayMonth(
        LunarCalendarUtils.solarToLunar(day),
      ),
      canChi: 'Can Chi placeholder',
      goodActivities: 'Good: study, travel, family gathering',
      badActivities: 'Avoid: major construction',
    );

    return CalendarSelectionResult(dayInfo: dayInfo, events: events);
  }

  @override
  Future<CalendarPayload> loadCalendarPayload() async {
    final markers = await calendarData.getAll();
    final specialLunarDays = markers
        .where(
          (m) => m.lunarDate.startsWith('01/') || m.lunarDate.endsWith('/01'),
        )
        .map((m) => m.date)
        .toSet();
    return CalendarPayload(
      markers: markers,
      specialLunarDays: specialLunarDays,
    );
  }
}
