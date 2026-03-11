class DynastyModel {
  const DynastyModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.startYear,
    required this.endYear,
    required this.description,
    required this.capital,
    required this.chinaContext,
    required this.legacy,
  });

  final String id;
  final String slug;
  final String name;
  final int startYear;
  final int endYear;
  final String description;
  final String capital;
  final String chinaContext;
  final String legacy;

  factory DynastyModel.fromJson(Map<String, dynamic> json) {
    return DynastyModel(
      id: json['_id'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      startYear: (json['startYear'] as num).toInt(),
      endYear: (json['endYear'] as num).toInt(),
      description: json['description'] as String,
      capital: json['capital'] as String,
      chinaContext: json['chinaContext'] as String,
      legacy: json['legacy'] as String,
    );
  }
}
