import 'package:mera_history/data/datasources/local/mock_daily_quiz_datasource.dart';
import 'package:mera_history/data/models/daily_quiz_model.dart';

class DailyQuizRepository {
  DailyQuizRepository(this._dataSource);

  final MockDailyQuizDataSource _dataSource;

  Future<DailyQuizModel> getQuizForDate(DateTime date) async {
    final quizzes = await _dataSource.getQuizzes();
    if (quizzes.isEmpty) {
      throw StateError(
        'Không có dữ liệu câu hỏi trong assets/mock/daily_quizzes.json',
      );
    }
    final firstDayOfYear = DateTime(date.year, 1, 1);
    final dayOfYear = date.difference(firstDayOfYear).inDays + 1;
    return quizzes[dayOfYear % quizzes.length];
  }
}
