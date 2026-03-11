class King {
  const King({
    required this.id,
    required this.name,
    required this.dynastyId,
    required this.dynastyName,
    required this.reignStart,
    required this.reignEnd,
    required this.shortDescription,
    required this.relatedEventIds,
    required this.image,
  });

  final String id;
  final String name;
  final String dynastyId;
  final String dynastyName;
  final int reignStart;
  final int reignEnd;
  final String shortDescription;
  final List<String> relatedEventIds;
  final String image;
}
