import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';

abstract class TimelineRepository {
  Future<List<HistoryEventModel>> getTimeline();
}

class TimelineRepositoryImpl implements TimelineRepository {
  TimelineRepositoryImpl(this._historyDataRepository);

  final HistoryDataRepository _historyDataRepository;

  @override
  Future<List<HistoryEventModel>> getTimeline() async {
    final events = await _historyDataRepository.getAll();
    final sorted = [...events]..sort((a, b) => a.year.compareTo(b.year));
    return sorted;
  }
}
