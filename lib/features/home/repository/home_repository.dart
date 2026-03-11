import 'package:mera_history/core/utils/app_date_utils.dart';
import 'package:mera_history/data/repositories/daily_quiz_repository.dart';
import 'package:mera_history/data/repositories/dynasty_repository_impl.dart';
import 'package:mera_history/data/repositories/daily_advice_repository.dart';
import 'package:mera_history/data/repositories/hero_data_repository.dart';
import 'package:mera_history/data/repositories/history_data_repository.dart';
import 'package:mera_history/features/calendar/repository/lunar_day_repository.dart';
import 'package:mera_history/features/home/models/home_models.dart';

abstract class HomeRepository {
  Future<HomeDashboardModel> loadDashboard();
}

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({
    required this.historyData,
    required this.heroData,
    required this.dailyAdviceRepository,
    required this.lunarDayRepository,
    required this.dynastyRepository,
    required this.dailyQuizRepository,
  });

  final HistoryDataRepository historyData;
  final HeroDataRepository heroData;
  final DailyAdviceRepository dailyAdviceRepository;
  final LunarDayRepository lunarDayRepository;
  final DynastyRepositoryImpl dynastyRepository;
  final DailyQuizRepository dailyQuizRepository;

  @override
  Future<HomeDashboardModel> loadDashboard() async {
    final now = DateTime.now();
    final allEvents = await historyData.getAll();
    final todayKey = AppDateUtils.monthDay(now);
    final todayEvents = allEvents.where((e) => e.date == todayKey).toList();
    final figures = await heroData.getAll();
    final dynasties = await dynastyRepository.getAllDynasties();
    final lunarInfo = await lunarDayRepository.getLunarDayInfo(now);
    final dailyAdvice = await dailyAdviceRepository.getAdviceForDate(now);
    final dailyQuiz = await dailyQuizRepository.getQuizForDate(now);
    final good = lunarInfo.nenLam.join(', ');
    final avoid = lunarInfo.nenTranh.join(', ');

    return HomeDashboardModel(
      featuredEvent: todayEvents.isNotEmpty
          ? todayEvents.first
          : (allEvents.isNotEmpty ? allEvents.first : null),
      todayEvents: todayEvents.isNotEmpty
          ? todayEvents
          : allEvents.take(3).toList(),
      featuredFigures: figures.take(5).toList(),
      dailyAdvice: dailyAdvice,
      todayInfo: HomeTodayInfoModel(
        today: now,
        lunarText: '${lunarInfo.lunarDate} Âm lịch',
        canChi: '${lunarInfo.canChiDay} - ${lunarInfo.danhGiaNgay}',
        good: good,
        avoid: avoid,
      ),
      dynastyChips: dynasties.take(6).map((item) => item.name).toList(),
      dailyQuiz: dailyQuiz,
    );
  }
}
