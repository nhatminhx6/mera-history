import 'dart:math';

import 'package:intl/intl.dart';
import 'package:mera_history/data/datasources/local/mock_explore_config_datasource.dart';
import 'package:mera_history/data/datasources/local/mock_historical_theme_datasource.dart';
import 'package:mera_history/data/repositories/battle_repository_impl.dart';
import 'package:mera_history/data/repositories/dynasty_repository_impl.dart';
import 'package:mera_history/data/repositories/event_repository_impl.dart';
import 'package:mera_history/data/repositories/figure_repository_impl.dart';
import 'package:mera_history/data/repositories/hero_data_repository.dart';
import 'package:mera_history/data/repositories/king_repository_impl.dart';
import 'package:mera_history/data/repositories/parallel_timeline_repository_impl.dart';
import 'package:mera_history/features/explore/models/battle.dart';
import 'package:mera_history/features/explore/models/dynasty.dart';
import 'package:mera_history/features/explore/models/explore_hub_data.dart';
import 'package:mera_history/features/explore/models/historical_theme.dart';
import 'package:mera_history/features/explore/models/king.dart';
import 'package:mera_history/features/explore/models/parallel_timeline_item.dart';

abstract class ExploreRepository {
  Future<ExploreHubData> loadHub();
  Future<Dynasty?> getDynastyById(String id);
  Future<King?> getKingById(String id);
  Future<Battle?> getBattleById(String id);
  Future<HistoricalTheme?> getThemeById(String id);
  Future<List<ParallelTimelineItem>> getAllParallelTimelines();
  RandomTarget randomTarget(ExploreHubData data);
}

class ExploreRepositoryImpl implements ExploreRepository {
  ExploreRepositoryImpl({
    required this.eventRepository,
    required this.dynastyRepository,
    required this.kingRepository,
    required this.figureRepository,
    required this.battleRepository,
    required this.parallelTimelineRepository,
    required this.heroDataRepository,
    required this.themeDataSource,
    required this.configDataSource,
  });

  final EventRepositoryImpl eventRepository;
  final DynastyRepositoryImpl dynastyRepository;
  final KingRepositoryImpl kingRepository;
  final FigureRepositoryImpl figureRepository;
  final BattleRepositoryImpl battleRepository;
  final ParallelTimelineRepositoryImpl parallelTimelineRepository;
  final HeroDataRepository heroDataRepository;
  final MockHistoricalThemeDataSource themeDataSource;
  final MockExploreConfigDataSource configDataSource;

  @override
  Future<ExploreHubData> loadHub() async {
    final configJson = await configDataSource.getConfig();
    final eventRows = await eventRepository.getAllEvents();
    final dynastyRows = await dynastyRepository.getAllDynasties();
    final kingRows = await kingRepository.getAllKings();
    final figureRows = await figureRepository.getAllFigures();
    final battleRows = await battleRepository.getAllBattles();
    final timelineRows = await parallelTimelineRepository.getAllTimelines();
    final themeRows = await themeDataSource.getThemes();
    final heroes = await heroDataRepository.getAll();

    final dynastyById = {
      for (final dynasty in dynastyRows) dynasty.id: dynasty,
    };
    final heroIdByName = {for (final hero in heroes) hero.name: hero.id};

    final events = eventRows.map((event) {
      return ExploreEventItem(
        id: event.id,
        title: event.title,
        year: event.year,
        summary: event.summary.isNotEmpty ? event.summary : event.vietnamEvent,
        context: event.chinaContext.isNotEmpty
            ? 'Bối cảnh khu vực'
            : 'Việt Nam',
        image: 'https://picsum.photos/seed/${event.id}/1200/800',
        monthDay: _monthDayFromEvent(event.id, event.year),
      );
    }).toList()..sort((a, b) => b.year.compareTo(a.year));

    final dynasties = dynastyRows.map((row) {
      return Dynasty(
        id: row.id,
        slug: row.slug,
        name: row.name,
        startYear: row.startYear,
        endYear: row.endYear,
        description: row.description,
        capital: row.capital,
        chinaContext: row.chinaContext,
        legacy: row.legacy,
      );
    }).toList()..sort((a, b) => a.startYear.compareTo(b.startYear));

    final kings = kingRows.map((row) {
      return King(
        id: row.id,
        name: row.name,
        dynastyId: row.dynastyId,
        dynastyName: dynastyById[row.dynastyId]?.name ?? 'Không rõ',
        reignStart: row.reignStart,
        reignEnd: row.reignEnd,
        shortDescription: row.shortDescription,
        relatedEventIds: row.relatedEventIds,
        image: 'https://picsum.photos/seed/${row.id}/900/1200',
      );
    }).toList()..sort((a, b) => a.reignStart.compareTo(b.reignStart));

    final figures = figureRows.map((row) {
      return ExploreFigure(
        id: row.id,
        name: row.name,
        role: row.role,
        period: row.period,
        description: row.description,
        image: 'https://picsum.photos/seed/${row.id}/900/1200',
        heroId: heroIdByName[row.name] ?? 0,
      );
    }).toList();

    final battles = battleRows.map((row) {
      return Battle(
        id: row.id,
        name: row.name,
        year: row.year,
        location: row.location,
        commanders: row.commanders,
        result: row.result,
        description: row.description,
        dynastyId: row.dynastyId,
        dynastyName: dynastyById[row.dynastyId]?.name ?? 'Không rõ',
      );
    }).toList()..sort((a, b) => b.year.compareTo(a.year));

    final parallelTimelines = timelineRows.map((row) {
      return ParallelTimelineItem(
        id: row.id,
        year: row.year,
        vietnam: row.vietnam,
        china: row.china,
        world: row.world,
        impact: row.impact,
      );
    }).toList();

    final themes = themeRows.map((row) {
      return HistoricalTheme(
        id: row['_id'] as String,
        title: row['title'] as String,
        description: row['description'] as String,
        icon: row['icon'] as String,
        coverImage: row['coverImage'] as String,
      );
    }).toList();

    final todayKey = DateFormat('MM-dd').format(DateTime.now());
    final todayEvents = events
        .where((event) => event.monthDay == todayKey)
        .take(6)
        .toList();

    final config = ExploreConfig(
      filterChips: (configJson['filterChips'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      figureRoleChips: (configJson['figureRoleChips'] as List<dynamic>)
          .map((item) => item.toString())
          .toList(),
      randomTitle:
          (configJson['randomDiscovery'] as Map<String, dynamic>)['title']
              as String,
      randomDescription:
          (configJson['randomDiscovery'] as Map<String, dynamic>)['description']
              as String,
      randomButton:
          (configJson['randomDiscovery'] as Map<String, dynamic>)['buttonText']
              as String,
    );

    return ExploreHubData(
      config: config,
      featuredEvents: events.take(4).toList(),
      todayEvents: todayEvents,
      parallelTimelines: parallelTimelines,
      dynasties: dynasties,
      kings: kings,
      figures: figures,
      battles: battles,
      themes: themes,
    );
  }

  @override
  Future<Dynasty?> getDynastyById(String id) async {
    final dynasties = (await loadHub()).dynasties;
    for (final dynasty in dynasties) {
      if (dynasty.id == id) return dynasty;
    }
    return null;
  }

  @override
  Future<King?> getKingById(String id) async {
    final kings = (await loadHub()).kings;
    for (final king in kings) {
      if (king.id == id) return king;
    }
    return null;
  }

  @override
  Future<Battle?> getBattleById(String id) async {
    final battles = (await loadHub()).battles;
    for (final battle in battles) {
      if (battle.id == id) return battle;
    }
    return null;
  }

  @override
  Future<HistoricalTheme?> getThemeById(String id) async {
    final themes = (await loadHub()).themes;
    for (final theme in themes) {
      if (theme.id == id) return theme;
    }
    return null;
  }

  @override
  Future<List<ParallelTimelineItem>> getAllParallelTimelines() async {
    return (await loadHub()).parallelTimelines;
  }

  @override
  RandomTarget randomTarget(ExploreHubData data) {
    final candidates = <RandomTarget>[
      ...data.featuredEvents.map(
        (item) => RandomTarget(
          type: RandomTargetType.event,
          id: item.id,
          route: '/kham-pha/su-kien/${item.id}',
        ),
      ),
      ...data.figures
          .where((item) => item.heroId > 0)
          .map(
            (item) => RandomTarget(
              type: RandomTargetType.figure,
              id: item.id,
              route: '/kham-pha/nhan-vat/${item.heroId}',
            ),
          ),
      ...data.battles.map(
        (item) => RandomTarget(
          type: RandomTargetType.battle,
          id: item.id,
          route: '/kham-pha/tran-danh/${item.id}',
        ),
      ),
      ...data.dynasties.map(
        (item) => RandomTarget(
          type: RandomTargetType.dynasty,
          id: item.id,
          route: '/kham-pha/trieu-dai/${item.id}',
        ),
      ),
    ];

    if (candidates.isEmpty) {
      return const RandomTarget(
        type: RandomTargetType.event,
        id: '',
        route: '/',
      );
    }
    return candidates[Random().nextInt(candidates.length)];
  }

  String _monthDayFromEvent(String id, int year) {
    final hash = id.codeUnits.fold<int>(0, (sum, item) => sum + item.abs());
    final month = ((hash + year.abs()) % 12) + 1;
    final day = ((hash + year.abs()) % 28) + 1;
    return '${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
}
