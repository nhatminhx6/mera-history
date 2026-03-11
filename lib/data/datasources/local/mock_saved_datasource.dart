import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/saved_content_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class MockSavedDataSource {
  MockSavedDataSource(this._jsonService);

  final LocalJsonService _jsonService;

  Future<SavedContentModel> getSavedContent() async {
    await Future<void>.delayed(const Duration(milliseconds: 220));
    final rows = await _jsonService.readList(AppAssets.mockSavedContent);
    if (rows.isEmpty) {
      throw StateError(
        'Không có dữ liệu saved_content trong assets/mock/saved_content.json',
      );
    }
    return SavedContentModel.fromJson(rows.first);
  }
}
