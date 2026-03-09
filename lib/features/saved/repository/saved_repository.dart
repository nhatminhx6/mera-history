import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/features/saved/models/saved_models.dart';

abstract class SavedRepository {
  Future<List<HistoryEventModel>> savedEvents();
  Future<List<HeroModel>> savedFigures();
  Future<List<ReadingHistoryItem>> readingHistory();
}

class SavedRepositoryImpl implements SavedRepository {
  @override
  Future<List<ReadingHistoryItem>> readingHistory() async {
    return [
      ReadingHistoryItem(
        title: 'Japanese coup in French Indochina',
        time: 'Read 2 hours ago',
      ),
      ReadingHistoryItem(
        title: 'Tran Hung Dao profile',
        time: 'Read yesterday',
      ),
    ];
  }

  @override
  Future<List<HistoryEventModel>> savedEvents() async => const [];

  @override
  Future<List<HeroModel>> savedFigures() async => const [];
}
