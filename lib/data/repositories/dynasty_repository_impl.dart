import 'package:mera_history/data/datasources/local/mock_dynasty_datasource.dart';
import 'package:mera_history/data/models/dynasty_model.dart';

class DynastyRepositoryImpl {
  DynastyRepositoryImpl(this._dataSource);

  final MockDynastyDataSource _dataSource;

  Future<List<DynastyModel>> getAllDynasties() {
    return _dataSource.getDynasties();
  }

  Future<DynastyModel?> getDynastyById(String id) async {
    final dynasties = await _dataSource.getDynasties();
    for (final dynasty in dynasties) {
      if (dynasty.id == id) return dynasty;
    }
    return null;
  }
}
