import 'package:mera_history/data/datasources/local/mock_event_datasource.dart';
import 'package:mera_history/data/models/event_model.dart';

class EventRepositoryImpl {
  EventRepositoryImpl(this._dataSource);

  final MockEventDataSource _dataSource;

  Future<List<EventModel>> getAllEvents() {
    return _dataSource.getEvents();
  }

  Future<EventModel?> getEventById(String id) async {
    final events = await _dataSource.getEvents();
    for (final event in events) {
      if (event.id == id) return event;
    }
    return null;
  }

  Future<List<EventModel>> getEventsByIds(List<String> ids) async {
    if (ids.isEmpty) return const [];
    final idSet = ids.toSet();
    final events = await _dataSource.getEvents();
    return events.where((event) => idSet.contains(event.id)).toList();
  }

  Future<List<EventModel>> getEventsByFigureId(String figureId) async {
    final events = await _dataSource.getEvents();
    return events.where((event) => event.figureIds.contains(figureId)).toList();
  }
}
