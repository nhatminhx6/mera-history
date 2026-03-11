import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/profile_stats_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockProfileDataSource {
  MockProfileDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<ProfileStatsModel> getProfileStats() async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    final rows = await _jsonService.readList(AppAssets.mockProfileStats);
    if (rows.isEmpty) {
      throw StateError(
        'Không có dữ liệu profile_stats trong assets/mock/profile_stats.json',
      );
    }
    return ProfileStatsModel.fromJson(rows.first);
  }
}
