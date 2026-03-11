import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/daily_advice.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class DailyAdviceRepository {
  DailyAdviceRepository(this._jsonService);

  final LocalJsonService _jsonService;

  Future<DailyAdvice> getAdviceForDate(DateTime date) async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    final rows = await _jsonService.readList(AppAssets.mockDailyAdvice);
    final list = rows.map(DailyAdvice.fromJson).toList();

    if (list.isEmpty) {
      throw StateError(
        'Không có dữ liệu daily_advice trong assets/mock/daily_advice.json',
      );
    }

    final firstDayOfYear = DateTime(date.year, 1, 1);
    final dayOfYear = date.difference(firstDayOfYear).inDays + 1;
    final index = dayOfYear % list.length;
    return list[index];
  }
}
