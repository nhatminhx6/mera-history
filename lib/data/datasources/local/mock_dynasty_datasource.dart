import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/dynasty_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockDynastyDataSource {
  MockDynastyDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<DynastyModel>> getDynasties() async {
    await Future<void>.delayed(const Duration(milliseconds: 220));
    final rows = await _jsonService.readList(AppAssets.mockDynasties);
    return rows.map(DynastyModel.fromJson).toList();
  }
}
