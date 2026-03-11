import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockHistoricalThemeDataSource {
  MockHistoricalThemeDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<Map<String, dynamic>>> getThemes() async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    return _jsonService.readList(AppAssets.mockHistoricalThemes);
  }
}
