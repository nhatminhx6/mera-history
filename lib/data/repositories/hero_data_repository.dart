import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class HeroDataRepository {
  HeroDataRepository(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<HeroModel>> getAll() async {
    final rows = await _jsonService.readList(AppAssets.heroes);
    return rows.map(HeroModel.fromJson).toList();
  }
}
