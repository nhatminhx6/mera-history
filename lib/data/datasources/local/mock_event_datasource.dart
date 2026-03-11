import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/event_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockEventDataSource {
  MockEventDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<EventModel>> getEvents() async {
    await Future<void>.delayed(const Duration(milliseconds: 260));
    final rows = await _jsonService.readList(AppAssets.mockEvents);
    return rows.map(EventModel.fromJson).toList();
  }
}
