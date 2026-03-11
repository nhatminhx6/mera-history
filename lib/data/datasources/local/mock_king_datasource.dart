import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/king_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockKingDataSource {
  MockKingDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<KingModel>> getKings() async {
    await Future<void>.delayed(const Duration(milliseconds: 240));
    final rows = await _jsonService.readList(AppAssets.mockKings);
    return rows.map(KingModel.fromJson).toList();
  }
}
