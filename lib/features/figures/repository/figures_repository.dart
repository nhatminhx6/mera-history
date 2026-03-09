import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/repositories/hero_data_repository.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';
import 'package:mera_history/features/figures/models/figures_models.dart';

abstract class FiguresRepository {
  Future<List<HeroModel>> getAllFigures();
  Future<HeroModel?> getFigureById(int id);
  Future<List<HistoryEventModel>> getRelatedEvents(int id);
}

class FiguresRepositoryImpl implements FiguresRepository {
  FiguresRepositoryImpl({required this.heroData, required this.historyData});

  final HeroDataRepository heroData;
  final HistoryDataRepository historyData;

  @override
  Future<List<HeroModel>> getAllFigures() => heroData.getAll();

  @override
  Future<HeroModel?> getFigureById(int id) async {
    final all = await heroData.getAll();
    for (final figure in all) {
      if (figure.id == id) return figure;
    }
    return null;
  }

  @override
  Future<List<HistoryEventModel>> getRelatedEvents(int id) async {
    final figure = await getFigureById(id);
    final events = await historyData.getAll();
    if (figure == null) return const [];
    final needle = figure.name.split(' ').first.toLowerCase();
    return events.where((e) => e.title.toLowerCase().contains(needle)).toList();
  }

  static List<HeroModel> applyFilter({
    required List<HeroModel> source,
    required FigureFilter filter,
    required String query,
  }) {
    final lowered = query.toLowerCase().trim();

    return source.where((figure) {
      final matchesQuery =
          lowered.isEmpty ||
          figure.name.toLowerCase().contains(lowered) ||
          figure.period.toLowerCase().contains(lowered);
      if (!matchesQuery) return false;

      return switch (filter) {
        FigureFilter.generals => figure.role.toLowerCase() == 'general',
        FigureFilter.emperors => figure.role.toLowerCase() == 'emperor',
        FigureFilter.scholars => figure.role.toLowerCase() == 'scholar',
        FigureFilter.revolutionaries =>
          figure.role.toLowerCase() == 'revolutionary',
      };
    }).toList();
  }
}
