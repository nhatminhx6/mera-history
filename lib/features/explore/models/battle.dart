class Battle {
  const Battle({
    required this.id,
    required this.name,
    required this.year,
    required this.location,
    required this.commanders,
    required this.result,
    required this.description,
    required this.dynastyId,
    required this.dynastyName,
  });

  final String id;
  final String name;
  final int year;
  final String location;
  final List<String> commanders;
  final String result;
  final String description;
  final String dynastyId;
  final String dynastyName;
}
