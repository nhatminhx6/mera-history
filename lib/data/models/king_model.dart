class KingModel {
  const KingModel({
    required this.id,
    required this.name,
    required this.dynastyId,
    required this.reignStart,
    required this.reignEnd,
    required this.shortDescription,
    required this.relatedEventIds,
  });

  final String id;
  final String name;
  final String dynastyId;
  final int reignStart;
  final int reignEnd;
  final String shortDescription;
  final List<String> relatedEventIds;

  factory KingModel.fromJson(Map<String, dynamic> json) {
    return KingModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      dynastyId: json['dynastyId'] as String,
      reignStart: (json['reignStart'] as num).toInt(),
      reignEnd: (json['reignEnd'] as num).toInt(),
      shortDescription: json['shortDescription'] as String,
      relatedEventIds: (json['relatedEventIds'] as List<dynamic>)
          .map((id) => id.toString())
          .toList(),
    );
  }
}
