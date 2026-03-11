class Dynasty {
  const Dynasty({
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
}
