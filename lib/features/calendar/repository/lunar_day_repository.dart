import 'package:intl/intl.dart';
import 'package:mera_history/core/utils/lunar_calendar_utils.dart';
import 'package:mera_history/data/services/local_json_service.dart';
import 'package:mera_history/features/calendar/models/lunar_day_info.dart';

class LunarDayRepository {
  LunarDayRepository(this._jsonService);

  final LocalJsonService _jsonService;

  Future<LunarDayInfo> getLunarDayInfo(DateTime date) async {
    final rows = await _jsonService.readList('assets/data/lunar_day_info.json');
    final key = DateFormat('yyyy-MM-dd').format(date);

    for (final row in rows) {
      if (row['solarDate'] == key) {
        return LunarDayInfo.fromJson(row);
      }
    }

    final lunar = LunarCalendarUtils.solarToLunar(date);
    return LunarDayInfo(
      solarDate: key,
      lunarDate: LunarCalendarUtils.formatDayMonth(lunar),
      canChiDay: 'Giáp Thìn',
      nguHanh: 'Hành Hỏa',
      truc: 'Trực Mãn',
      danhGiaNgay: 'Ngày bình ổn',
      nenLam: const ['Học tập', 'Gặp gỡ', 'Lập kế hoạch'],
      nenTranh: const ['Động thổ', 'Tranh chấp'],
      gioHoangDao: const [
        'Tý 23:00–01:00',
        'Sửu 01:00–03:00',
        'Thìn 07:00–09:00',
      ],
      huongXuatHanh: const {
        'Hỷ thần': 'Đông Nam',
        'Tài thần': 'Chính Tây',
        'Hạc thần': 'Tránh hướng Bắc',
      },
    );
  }
}
