class FigureModel {
  const FigureModel({
    required this.id,
    required this.name,
    required this.role,
    required this.period,
    required this.description,
    required this.relatedEventIds,
  });

  final String id;
  final String name;
  final String role;
  final String period;
  final String description;
  final List<String> relatedEventIds;

  factory FigureModel.fromJson(Map<String, dynamic> json) {
    return FigureModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      period: json['period'] as String,
      description: json['description'] as String,
      relatedEventIds: (json['relatedEventIds'] as List<dynamic>)
          .map((id) => id.toString())
          .toList(),
    );
  }
}
