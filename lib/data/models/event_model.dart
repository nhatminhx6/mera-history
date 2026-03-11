class EventModel {
  const EventModel({
    required this.id,
    required this.slug,
    required this.title,
    required this.year,
    required this.summary,
    required this.dynastyId,
    required this.figureIds,
    required this.battleIds,
    required this.vietnamEvent,
    required this.chinaContext,
    required this.regionalContext,
    required this.historicalImpact,
  });

  final String id;
  final String slug;
  final String title;
  final int year;
  final String summary;
  final String dynastyId;
  final List<String> figureIds;
  final List<String> battleIds;
  final String vietnamEvent;
  final String chinaContext;
  final String regionalContext;
  final String historicalImpact;

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['_id'] as String,
      slug: json['slug'] as String? ?? '',
      title: json['title'] as String,
      year: (json['year'] as num).toInt(),
      summary: json['summary'] as String? ?? '',
      dynastyId: json['dynastyId'] as String,
      figureIds: (json['figureIds'] as List<dynamic>)
          .map((id) => id.toString())
          .toList(),
      battleIds: (json['battleIds'] as List<dynamic>)
          .map((id) => id.toString())
          .toList(),
      vietnamEvent: json['vietnamEvent'] as String? ?? '',
      chinaContext: json['chinaContext'] as String? ?? '',
      regionalContext: json['regionalContext'] as String? ?? '',
      historicalImpact: json['historicalImpact'] as String? ?? '',
    );
  }
}
