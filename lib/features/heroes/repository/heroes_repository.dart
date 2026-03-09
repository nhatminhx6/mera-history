import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/repositories/hero_data_repository.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';

abstract class HeroesRepository {
  Future<List<HeroModel>> getHeroes();
  Future<HeroModel?> getHeroById(int id);
  Future<List<HistoryEventModel>> getRelatedEvents(int heroId);
}

class HeroesRepositoryImpl implements HeroesRepository {
  HeroesRepositoryImpl({required this.heroData, required this.historyData});

  final HeroDataRepository heroData;
  final HistoryDataRepository historyData;

  @override
  Future<HeroModel?> getHeroById(int id) async {
    final heroes = await heroData.getAll();
    return heroes.where((h) => h.id == id).firstOrNull;
  }

  @override
  Future<List<HeroModel>> getHeroes() => heroData.getAll();

  @override
  Future<List<HistoryEventModel>> getRelatedEvents(int heroId) async {
    final hero = await getHeroById(heroId);
    final events = await historyData.getAll();
    if (hero == null) return const [];
    final heroNameWord = hero.name.split(' ').first.toLowerCase();
    return events
        .where((e) => e.title.toLowerCase().contains(heroNameWord))
        .toList();
  }
}
