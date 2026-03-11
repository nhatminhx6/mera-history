import 'package:mera_history/core/constants/app_assets.dart';
import 'package:intl/intl.dart';
import 'package:mera_history/core/utils/lunar_calendar_utils.dart';
import 'package:mera_history/data/services/local_json_service.dart';
import 'package:mera_history/features/calendar/models/lunar_day_info.dart';

class LunarDayRepository {
  LunarDayRepository(this._jsonService);

  final LocalJsonService _jsonService;

  Future<LunarDayInfo> getLunarDayInfo(DateTime date) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final rows = await _jsonService.readList(AppAssets.mockLunarDayInfo);
    final key = DateFormat('yyyy-MM-dd').format(date);

    for (final row in rows) {
      if (row['solarDate'] == key) {
        return LunarDayInfo.fromJson(row);
      }
    }

    final lunar = LunarCalendarUtils.solarToLunar(date);
    if (rows.isNotEmpty) {
      final sample = LunarDayInfo.fromJson(rows.first);
      return LunarDayInfo(
        solarDate: key,
        lunarDate: LunarCalendarUtils.formatDayMonth(lunar),
        canChiDay: sample.canChiDay,
        nguHanh: sample.nguHanh,
        truc: sample.truc,
        danhGiaNgay: sample.danhGiaNgay,
        nenLam: sample.nenLam,
        nenTranh: sample.nenTranh,
        gioHoangDao: sample.gioHoangDao,
        huongXuatHanh: sample.huongXuatHanh,
      );
    }

    throw StateError(
      'Không có dữ liệu lunar_day_info trong assets/mock/lunar_day_info.json',
    );
  }
}
