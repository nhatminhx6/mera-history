import 'package:mera_history/data/datasources/local/mock_figure_datasource.dart';
import 'package:mera_history/data/models/figure_model.dart';

class FigureRepositoryImpl {
  FigureRepositoryImpl(this._dataSource);

  final MockFigureDataSource _dataSource;

  Future<List<FigureModel>> getAllFigures() {
    return _dataSource.getFigures();
  }

  Future<FigureModel?> getFigureById(String id) async {
    final figures = await _dataSource.getFigures();
    for (final figure in figures) {
      if (figure.id == id) return figure;
    }
    return null;
  }

  Future<List<FigureModel>> getFiguresByIds(List<String> ids) async {
    if (ids.isEmpty) return const [];
    final idSet = ids.toSet();
    final figures = await _dataSource.getFigures();
    return figures.where((figure) => idSet.contains(figure.id)).toList();
  }
}
