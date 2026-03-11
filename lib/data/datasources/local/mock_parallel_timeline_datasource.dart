import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/parallel_timeline_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockParallelTimelineDataSource {
  MockParallelTimelineDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<ParallelTimelineModel>> getTimelines() async {
    await Future<void>.delayed(const Duration(milliseconds: 240));
    final rows = await _jsonService.readList(AppAssets.mockParallelTimelines);
    return rows.map(ParallelTimelineModel.fromJson).toList();
  }
}
