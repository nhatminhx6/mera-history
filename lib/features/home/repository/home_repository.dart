import 'package:mera_history/core/utils/app_date_utils.dart';
import 'package:mera_history/data/repositories/hero_data_repository.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';
import 'package:mera_history/features/home/models/home_models.dart';

abstract class HomeRepository {
  Future<HomeDashboardModel> loadDashboard();
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.historyData, required this.heroData});

  final HistoryDataRepository historyData;
  final HeroDataRepository heroData;

  @override
  Future<HomeDashboardModel> loadDashboard() async {
    final allEvents = await historyData.getAll();
    final todayKey = AppDateUtils.monthDay(DateTime.now());
    final todayEvents = allEvents.where((e) => e.date == todayKey).toList();
    final figures = await heroData.getAll();

    return HomeDashboardModel(
      featuredEvent: todayEvents.isNotEmpty
          ? todayEvents.first
          : (allEvents.isNotEmpty ? allEvents.first : null),
      todayEvents: todayEvents,
      featuredFigures: figures.take(5).toList(),
    );
  }
}
