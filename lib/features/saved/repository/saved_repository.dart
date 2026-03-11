import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/repositories/figure_repository_impl.dart';
import 'package:mera_history/data/repositories/hero_data_repository.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';
import 'package:mera_history/data/repositories/saved_content_repository.dart';
import 'package:mera_history/features/saved/models/saved_models.dart';

abstract class SavedRepository {
  Future<List<HistoryEventModel>> savedEvents();
  Future<List<HeroModel>> savedFigures();
  Future<List<ReadingHistoryItem>> readingHistory();
}

class SavedRepositoryImpl implements SavedRepository {
  SavedRepositoryImpl({
    required this.savedContentRepository,
    required this.historyDataRepository,
    required this.heroDataRepository,
    required this.figureRepository,
  });

  final SavedContentRepository savedContentRepository;
  final HistoryDataRepository historyDataRepository;
  final HeroDataRepository heroDataRepository;
  final FigureRepositoryImpl figureRepository;

  @override
  Future<List<ReadingHistoryItem>> readingHistory() async {
    final content = await savedContentRepository.getSavedContent();
    return content.readingHistory
        .map((item) => ReadingHistoryItem(title: item.title, time: item.time))
        .toList();
  }

  @override
  Future<List<HistoryEventModel>> savedEvents() async {
    final content = await savedContentRepository.getSavedContent();
    final allEvents = await historyDataRepository.getAll();
    final idSet = content.savedEventIds.toSet();
    return allEvents.where((event) => idSet.contains(event.id)).toList();
  }

  @override
  Future<List<HeroModel>> savedFigures() async {
    final content = await savedContentRepository.getSavedContent();
    final allFigures = await figureRepository.getAllFigures();
    final savedFigureIds = content.savedFigureIds.toSet();
    final savedNames = allFigures
        .where((figure) => savedFigureIds.contains(figure.id))
        .map((figure) => figure.name)
        .toSet();

    final heroes = await heroDataRepository.getAll();
    return heroes.where((hero) => savedNames.contains(hero.name)).toList();
  }
}
