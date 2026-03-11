import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/models/event_model.dart';
import 'package:mera_history/data/repositories/event_repository_impl.dart';
import 'package:mera_history/data/repositories/figure_repository_impl.dart';
import 'package:mera_history/data/repositories/hero_data_repository.dart';
import 'package:mera_history/features/figures/models/figures_models.dart';

abstract class FiguresRepository {
  Future<List<HeroModel>> getAllFigures();
  Future<HeroModel?> getFigureById(int id);
  Future<List<HistoryEventModel>> getRelatedEvents(int id);
}

class FiguresRepositoryImpl implements FiguresRepository {
  FiguresRepositoryImpl({
    required this.heroData,
    required this.figureApiRepository,
    required this.eventApiRepository,
  });

  final HeroDataRepository heroData;
  final FigureRepositoryImpl figureApiRepository;
  final EventRepositoryImpl eventApiRepository;

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
    final figures = await figureApiRepository.getAllFigures();
    if (id < 1 || id > figures.length) return const [];
    final selected = figures[id - 1];

    final fromRelation = await eventApiRepository.getEventsByIds(
      selected.relatedEventIds,
    );
    if (fromRelation.isNotEmpty) {
      return fromRelation.map(_mapEventToHistory).toList();
    }

    final byFigure = await eventApiRepository.getEventsByFigureId(selected.id);
    return byFigure.map(_mapEventToHistory).toList();
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
        FigureFilter.generals =>
          figure.role.toLowerCase() == 'tướng' ||
              figure.role.toLowerCase() == 'anh hùng dân tộc',
        FigureFilter.emperors => figure.role.toLowerCase() == 'vua',
        FigureFilter.scholars =>
          figure.role.toLowerCase() == 'học giả' ||
              figure.role.toLowerCase() == 'danh sĩ',
        FigureFilter.revolutionaries =>
          figure.role.toLowerCase() == 'lãnh tụ' ||
              figure.role.toLowerCase() == 'nhà cải cách',
      };
    }).toList();
  }

  HistoryEventModel _mapEventToHistory(EventModel event) {
    final month = (event.year.abs() % 12) + 1;
    final day = (event.year.abs() % 28) + 1;
    final date =
        '${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
    return HistoryEventModel(
      id: event.id,
      date: date,
      year: event.year,
      title: event.title,
      description: event.summary.isNotEmpty
          ? event.summary
          : event.vietnamEvent,
      image: 'https://picsum.photos/seed/${event.id}/1200/800',
      country: event.year % 7 == 0 ? 'Thế giới' : 'Việt Nam',
    );
  }
}
