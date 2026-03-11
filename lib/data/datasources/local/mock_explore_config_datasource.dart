import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockExploreConfigDataSource {
  MockExploreConfigDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<Map<String, dynamic>> getConfig() async {
    await Future<void>.delayed(const Duration(milliseconds: 120));
    final rows = await _jsonService.readList(AppAssets.mockExploreConfig);
    if (rows.isEmpty) {
      throw StateError(
        'Không có dữ liệu explore_config trong assets/mock/explore_config.json',
      );
    }
    return rows.first;
  }
}
