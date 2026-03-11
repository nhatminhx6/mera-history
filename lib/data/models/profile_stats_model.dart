class ProfileStatsModel {
  const ProfileStatsModel({
    required this.id,
    required this.displayName,
    required this.themePreference,
    required this.bookmarkCount,
    required this.readingStreak,
    required this.lastActive,
  });

  final String id;
  final String displayName;
  final String themePreference;
  final int bookmarkCount;
  final int readingStreak;
  final String lastActive;

  factory ProfileStatsModel.fromJson(Map<String, dynamic> json) {
    return ProfileStatsModel(
      id: json['_id'] as String,
      displayName: json['displayName'] as String,
      themePreference: json['themePreference'] as String,
      bookmarkCount: (json['bookmarkCount'] as num).toInt(),
      readingStreak: (json['readingStreak'] as num).toInt(),
      lastActive: json['lastActive'] as String,
    );
  }
}
