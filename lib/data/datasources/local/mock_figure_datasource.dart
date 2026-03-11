import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/figure_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockFigureDataSource {
  MockFigureDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<FigureModel>> getFigures() async {
    await Future<void>.delayed(const Duration(milliseconds: 220));
    final rows = await _jsonService.readList(AppAssets.mockFigures);
    return rows.map(FigureModel.fromJson).toList();
  }
}
