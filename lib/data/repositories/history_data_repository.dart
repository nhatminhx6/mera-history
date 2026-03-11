import 'package:mera_history/data/models/event_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/repositories/event_repository_impl.dart';

class HistoryDataRepository {
  HistoryDataRepository(this._eventRepository);

  final EventRepositoryImpl _eventRepository;

  Future<List<HistoryEventModel>> getAll() async {
    final events = await _eventRepository.getAllEvents();
    return events.map(_mapEventToHistory).toList();
  }

  HistoryEventModel _mapEventToHistory(EventModel event) {
    final month = (event.year.abs() % 12) + 1;
    final day = (event.year.abs() % 28) + 1;
    final date =
        '${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

    final country = event.year % 7 == 0 ? 'Thế giới' : 'Việt Nam';
    final description = event.summary.isNotEmpty
        ? event.summary
        : (event.vietnamEvent.isNotEmpty
              ? event.vietnamEvent
              : 'Sự kiện lịch sử đáng chú ý.');

    return HistoryEventModel(
      id: event.id,
      date: date,
      year: event.year,
      title: event.title,
      description: description,
      image: 'https://picsum.photos/seed/${event.id}/1200/800',
      country: country,
    );
  }
}
