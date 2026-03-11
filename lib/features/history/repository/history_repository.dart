import 'package:mera_history/core/utils/app_date_utils.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';
import 'package:mera_history/features/history/models/history_models.dart';

abstract class HistoryRepository {
  Future<List<HistoryEventModel>> getAllEvents();
  Future<HistoryEventModel?> getEventById(String id);
}

class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl(this._dataRepository);

  final HistoryDataRepository _dataRepository;

  @override
  Future<List<HistoryEventModel>> getAllEvents() => _dataRepository.getAll();

  @override
  Future<HistoryEventModel?> getEventById(String id) async {
    final events = await _dataRepository.getAll();
    for (final event in events) {
      if (event.id == id) return event;
    }
    return null;
  }

  static List<HistoryEventModel> applyFilter({
    required List<HistoryEventModel> source,
    required HistoryFilter filter,
    required String query,
  }) {
    final lowered = query.toLowerCase().trim();
    final today = AppDateUtils.monthDay(DateTime.now());

    return source.where((event) {
      final matchesQuery =
          lowered.isEmpty ||
          event.title.toLowerCase().contains(lowered) ||
          event.description.toLowerCase().contains(lowered);

      if (!matchesQuery) return false;

      return switch (filter) {
        HistoryFilter.today => event.date == today,
        HistoryFilter.vietnam =>
          event.country.toLowerCase().contains('việt nam') ||
              event.country.toLowerCase().contains('đại việt'),
        HistoryFilter.world =>
          !event.country.toLowerCase().contains('việt nam') &&
              !event.country.toLowerCase().contains('đại việt'),
        HistoryFilter.timeline => true,
      };
    }).toList()..sort((a, b) => b.year.compareTo(a.year));
  }
}
