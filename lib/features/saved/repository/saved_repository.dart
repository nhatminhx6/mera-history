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
        title: 'Chiến thắng Ngọc Hồi - Đống Đa',
        time: 'Đọc cách đây 2 giờ',
      ),
      ReadingHistoryItem(title: 'Hồ sơ Trần Hưng Đạo', time: 'Đọc hôm qua'),
    ];
  }

  @override
  Future<List<HistoryEventModel>> savedEvents() async => const [];

  @override
  Future<List<HeroModel>> savedFigures() async => const [];
}
