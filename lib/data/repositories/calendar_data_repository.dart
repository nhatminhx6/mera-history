import 'package:mera_history/core/utils/lunar_calendar_utils.dart';
import 'package:mera_history/data/models/calendar_event_model.dart';
import 'package:mera_history/data/models/event_model.dart';
import 'package:mera_history/data/repositories/event_repository_impl.dart';

class CalendarDataRepository {
  CalendarDataRepository(this._eventRepository);

  final EventRepositoryImpl _eventRepository;

  Future<List<CalendarEventModel>> getAll() async {
    final events = await _eventRepository.getAllEvents();
    return events.map(_mapEventToMarker).toList();
  }

  CalendarEventModel _mapEventToMarker(EventModel event) {
    final month = (event.year.abs() % 12) + 1;
    final day = (event.year.abs() % 28) + 1;
    final baseDate = DateTime(DateTime.now().year, month, day);
    final lunar = LunarCalendarUtils.solarToLunar(baseDate);
    final date =
        '${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

    return CalendarEventModel(
      date: date,
      lunarDate: '${lunar.day}/${lunar.month}',
      label: event.title,
    );
  }
}
