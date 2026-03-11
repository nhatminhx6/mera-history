import 'package:mera_history/data/datasources/local/mock_parallel_timeline_datasource.dart';
import 'package:mera_history/data/models/parallel_timeline_model.dart';

class ParallelTimelineRepositoryImpl {
  ParallelTimelineRepositoryImpl(this._dataSource);

  final MockParallelTimelineDataSource _dataSource;

  Future<List<ParallelTimelineModel>> getAllTimelines() async {
    final timelines = await _dataSource.getTimelines();
    final sorted = [...timelines]..sort((a, b) => a.year.compareTo(b.year));
    return sorted;
  }
}
