class BattleModel {
  const BattleModel({
    required this.id,
    required this.name,
    required this.year,
    required this.location,
    required this.commanders,
    required this.result,
    required this.description,
    required this.dynastyId,
  });

  final String id;
  final String name;
  final int year;
  final String location;
  final List<String> commanders;
  final String result;
  final String description;
  final String dynastyId;

  factory BattleModel.fromJson(Map<String, dynamic> json) {
    return BattleModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      year: (json['year'] as num).toInt(),
      location: json['location'] as String,
      commanders: (json['commanders'] as List<dynamic>)
          .map((value) => value.toString())
          .toList(),
      result: json['result'] as String,
      description: json['description'] as String,
      dynastyId: json['dynastyId'] as String,
    );
  }
}
