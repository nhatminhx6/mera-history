import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/daily_quiz_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockDailyQuizDataSource {
  MockDailyQuizDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<DailyQuizModel>> getQuizzes() async {
    await Future<void>.delayed(const Duration(milliseconds: 180));
    final rows = await _jsonService.readList(AppAssets.mockDailyQuizzes);
    return rows.map(DailyQuizModel.fromJson).toList();
  }
}
