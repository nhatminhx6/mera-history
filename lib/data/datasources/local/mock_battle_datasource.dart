import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/battle_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockBattleDataSource {
  MockBattleDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<BattleModel>> getBattles() async {
    await Future<void>.delayed(const Duration(milliseconds: 220));
    final rows = await _jsonService.readList(AppAssets.mockBattles);
    return rows.map(BattleModel.fromJson).toList();
  }
}
