class LunarDayInfo {
  final String solarDate;
  final String lunarDate;
  final String canChiDay;
  final String nguHanh;
  final String truc;
  final String danhGiaNgay;
  final List<String> nenLam;
  final List<String> nenTranh;
  final List<String> gioHoangDao;
  final Map<String, String> huongXuatHanh;

  const LunarDayInfo({
    required this.solarDate,
    required this.lunarDate,
    required this.canChiDay,
    required this.nguHanh,
    required this.truc,
    required this.danhGiaNgay,
    required this.nenLam,
    required this.nenTranh,
    required this.gioHoangDao,
    required this.huongXuatHanh,
  });

  factory LunarDayInfo.fromJson(Map<String, dynamic> json) {
    return LunarDayInfo(
      solarDate: json['solarDate'] as String,
      lunarDate: json['lunarDate'] as String,
      canChiDay: json['canChiDay'] as String,
      nguHanh: json['nguHanh'] as String,
      truc: json['truc'] as String,
      danhGiaNgay: json['danhGiaNgay'] as String,
      nenLam: (json['nenLam'] as List<dynamic>).cast<String>(),
      nenTranh: (json['nenTranh'] as List<dynamic>).cast<String>(),
      gioHoangDao: (json['gioHoangDao'] as List<dynamic>).cast<String>(),
      huongXuatHanh: (json['huongXuatHanh'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, value as String),
      ),
    );
  }
}
