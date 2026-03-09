import 'package:mera_history/data/models/calendar_event_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';

class CalendarDayInfo {
  CalendarDayInfo({
    required this.solarDate,
    required this.lunarDate,
    required this.canChi,
    required this.goodActivities,
    required this.badActivities,
  });

  final DateTime solarDate;
  final String lunarDate;
  final String canChi;
  final String goodActivities;
  final String badActivities;
}

class CalendarPayload {
  CalendarPayload({required this.markers, required this.specialLunarDays});

  final List<CalendarEventModel> markers;
  final Set<String> specialLunarDays;
}

class CalendarSelectionResult {
  CalendarSelectionResult({required this.dayInfo, required this.events});

  final CalendarDayInfo dayInfo;
  final List<HistoryEventModel> events;
}
