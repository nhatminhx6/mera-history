import 'package:mera_history/features/explore/models/battle.dart';
import 'package:mera_history/features/explore/models/dynasty.dart';
import 'package:mera_history/features/explore/models/historical_theme.dart';
import 'package:mera_history/features/explore/models/king.dart';
import 'package:mera_history/features/explore/models/parallel_timeline_item.dart';

class ExploreEventItem {
  const ExploreEventItem({
    required this.id,
    required this.title,
    required this.year,
    required this.summary,
    required this.context,
    required this.image,
    required this.monthDay,
  });

  final String id;
  final String title;
  final int year;
  final String summary;
  final String context;
  final String image;
  final String monthDay;
}

class ExploreFigure {
  const ExploreFigure({
    required this.id,
    required this.name,
    required this.role,
    required this.period,
    required this.description,
    required this.image,
    required this.heroId,
  });

  final String id;
  final String name;
  final String role;
  final String period;
  final String description;
  final String image;
  final int heroId;
}

class ExploreConfig {
  const ExploreConfig({
    required this.filterChips,
    required this.figureRoleChips,
    required this.randomTitle,
    required this.randomDescription,
    required this.randomButton,
  });

  final List<String> filterChips;
  final List<String> figureRoleChips;
  final String randomTitle;
  final String randomDescription;
  final String randomButton;
}

class ExploreHubData {
  const ExploreHubData({
    required this.config,
    required this.featuredEvents,
    required this.todayEvents,
    required this.parallelTimelines,
    required this.dynasties,
    required this.kings,
    required this.figures,
    required this.battles,
    required this.themes,
  });

  final ExploreConfig config;
  final List<ExploreEventItem> featuredEvents;
  final List<ExploreEventItem> todayEvents;
  final List<ParallelTimelineItem> parallelTimelines;
  final List<Dynasty> dynasties;
  final List<King> kings;
  final List<ExploreFigure> figures;
  final List<Battle> battles;
  final List<HistoricalTheme> themes;
}

enum RandomTargetType { event, figure, battle, dynasty }

class RandomTarget {
  const RandomTarget({
    required this.type,
    required this.id,
    required this.route,
  });

  final RandomTargetType type;
  final String id;
  final String route;
}
