import 'package:mera_history/data/models/hero_model.dart';
import 'package:mera_history/data/models/history_event_model.dart';
import 'package:mera_history/data/models/daily_advice.dart';
import 'package:mera_history/data/models/daily_quiz_model.dart';

class HomeDashboardModel {
  HomeDashboardModel({
    required this.featuredEvent,
    required this.todayEvents,
    required this.featuredFigures,
    required this.dailyAdvice,
    required this.todayInfo,
    required this.dynastyChips,
    required this.dailyQuiz,
  });

  final HistoryEventModel? featuredEvent;
  final List<HistoryEventModel> todayEvents;
  final List<HeroModel> featuredFigures;
  final DailyAdvice dailyAdvice;
  final HomeTodayInfoModel todayInfo;
  final List<String> dynastyChips;
  final DailyQuizModel dailyQuiz;
}

class HomeTodayInfoModel {
  HomeTodayInfoModel({
    required this.today,
    required this.lunarText,
    required this.canChi,
    required this.good,
    required this.avoid,
  });

  final DateTime today;
  final String lunarText;
  final String canChi;
  final String good;
  final String avoid;
}
