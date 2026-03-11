class DailyAdvice {
  const DailyAdvice({
    required this.workAdvice,
    required this.communicationAdvice,
    required this.loveAdvice,
    required this.moneyAdvice,
    required this.luckAdvice,
  });

  final String workAdvice;
  final String communicationAdvice;
  final String loveAdvice;
  final String moneyAdvice;
  final String luckAdvice;

  factory DailyAdvice.fromJson(Map<String, dynamic> json) {
    return DailyAdvice(
      workAdvice: json['workAdvice'] as String,
      communicationAdvice: json['communicationAdvice'] as String,
      loveAdvice: json['loveAdvice'] as String,
      moneyAdvice: json['moneyAdvice'] as String,
      luckAdvice: json['luckAdvice'] as String,
    );
  }
}
