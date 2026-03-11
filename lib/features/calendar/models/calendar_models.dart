import 'package:mera_history/data/models/calendar_event_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/models/daily_advice.dart';
import 'package:mera_history/features/calendar/models/lunar_day_info.dart';

class CalendarPayload {
  CalendarPayload({required this.markers, required this.specialLunarDays});

  final List<CalendarEventModel> markers;
  final Set<String> specialLunarDays;
}

class CalendarSelectionResult {
  CalendarSelectionResult({
    required this.lunarInfo,
    required this.events,
    required this.dailyAdvice,
  });

  final LunarDayInfo lunarInfo;
  final List<HistoryEventModel> events;
  final DailyAdvice dailyAdvice;
}
