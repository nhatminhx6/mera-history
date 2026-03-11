class ParallelTimelineModel {
  const ParallelTimelineModel({
    required this.id,
    required this.year,
    required this.vietnam,
    required this.china,
    required this.world,
    required this.impact,
  });

  final String id;
  final int year;
  final String vietnam;
  final String china;
  final String world;
  final String impact;

  factory ParallelTimelineModel.fromJson(Map<String, dynamic> json) {
    return ParallelTimelineModel(
      id: json['_id'] as String,
      year: (json['year'] as num).toInt(),
      vietnam: json['vietnam'] as String,
      china: json['china'] as String,
      world: json['world'] as String,
      impact: json['impact'] as String,
    );
  }
}
