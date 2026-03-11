import 'package:mera_history/data/datasources/local/mock_profile_datasource.dart';
import 'package:mera_history/data/models/profile_stats_model.dart';

class ProfileStatsRepository {
  ProfileStatsRepository(this._dataSource);

  final MockProfileDataSource _dataSource;

  Future<ProfileStatsModel> getProfileStats() {
    return _dataSource.getProfileStats();
  }
}
