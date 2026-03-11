import 'package:mera_history/data/datasources/local/mock_battle_datasource.dart';
import 'package:mera_history/data/models/battle_model.dart';

class BattleRepositoryImpl {
  BattleRepositoryImpl(this._dataSource);

  final MockBattleDataSource _dataSource;

  Future<List<BattleModel>> getAllBattles() {
    return _dataSource.getBattles();
  }

  Future<List<BattleModel>> getBattlesByIds(List<String> ids) async {
    if (ids.isEmpty) return const [];
    final idSet = ids.toSet();
    final battles = await _dataSource.getBattles();
    return battles.where((battle) => idSet.contains(battle.id)).toList();
  }
}
