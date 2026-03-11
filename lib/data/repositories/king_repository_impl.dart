import 'package:mera_history/data/datasources/local/mock_king_datasource.dart';
import 'package:mera_history/data/models/king_model.dart';

class KingRepositoryImpl {
  KingRepositoryImpl(this._dataSource);

  final MockKingDataSource _dataSource;

  Future<List<KingModel>> getAllKings() {
    return _dataSource.getKings();
  }

  Future<List<KingModel>> getKingsByDynastyId(String dynastyId) async {
    final kings = await _dataSource.getKings();
    return kings.where((king) => king.dynastyId == dynastyId).toList();
  }
}
