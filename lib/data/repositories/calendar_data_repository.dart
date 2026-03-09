import 'package:mera_history/core/constants/app_assets.dart';
import 'package:mera_history/data/models/calendar_event_model.dart';
import 'package:mera_history/data/services/local_json_service.dart';

class CalendarDataRepository {
  CalendarDataRepository(this._jsonService);

  final LocalJsonService _jsonService;

  Future<List<CalendarEventModel>> getAll() async {
    final rows = await _jsonService.readList(AppAssets.calendarEvents);
    return rows.map(CalendarEventModel.fromJson).toList();
  }
}
