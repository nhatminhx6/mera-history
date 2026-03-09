import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';

class HomeDashboardModel {
  HomeDashboardModel({
    required this.featuredEvent,
    required this.todayEvents,
    required this.featuredFigures,
  });

  final HistoryEventModel? featuredEvent;
  final List<HistoryEventModel> todayEvents;
  final List<HeroModel> featuredFigures;
}
