import 'package:mera_history/core/utils/app_date_utils.dart';
import 'package:mera_history/data/repositories/calendar_data_repository.dart';
import 'package:mera_history/data/repositories/daily_advice_repository.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';
import 'package:mera_history/features/calendar/models/calendar_models.dart';
import 'package:mera_history/features/calendar/repository/lunar_day_repository.dart';

abstract class CalendarRepository {
  Future<CalendarPayload> loadCalendarPayload();
  Future<CalendarSelectionResult> loadDay(DateTime day);
}

class CalendarRepositoryImpl implements CalendarRepository {
  CalendarRepositoryImpl({
    required this.calendarData,
    required this.historyData,
    required this.lunarDayRepository,
    required this.dailyAdviceRepository,
  });

  final CalendarDataRepository calendarData;
  final HistoryDataRepository historyData;
  final LunarDayRepository lunarDayRepository;
  final DailyAdviceRepository dailyAdviceRepository;

  @override
  Future<CalendarSelectionResult> loadDay(DateTime day) async {
    final key = AppDateUtils.monthDay(day);
    final allEvents = await historyData.getAll();
    final events = allEvents.where((e) => e.date == key).toList();
    final lunarInfo = await lunarDayRepository.getLunarDayInfo(day);
    final dailyAdvice = await dailyAdviceRepository.getAdviceForDate(day);
    return CalendarSelectionResult(
      lunarInfo: lunarInfo,
      events: events,
      dailyAdvice: dailyAdvice,
    );
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
