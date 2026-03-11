import 'package:mera_history/data/datasources/local/mock_saved_datasource.dart';
import 'package:mera_history/data/models/saved_content_model.dart';

class SavedContentRepository {
  SavedContentRepository(this._dataSource);

  final MockSavedDataSource _dataSource;

  Future<SavedContentModel> getSavedContent() {
    return _dataSource.getSavedContent();
  }
}
