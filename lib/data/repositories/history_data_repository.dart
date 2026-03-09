import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class HistoryDataRepository {
  HistoryDataRepository(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<HistoryEventModel>> getAll() async {
    final rows = await _jsonService.readList(AppAssets.historyEvents);
    return rows.map(HistoryEventModel.fromJson).toList();
  }
}
