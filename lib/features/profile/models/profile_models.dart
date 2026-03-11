class ProfileOverviewModel {
  const ProfileOverviewModel({
    required this.displayName,
    required this.bookmarkCount,
    required this.readingStreak,
    required this.themeLabel,
    required this.lastActive,
  });

  final String displayName;
  final int bookmarkCount;
  final int readingStreak;
  final String themeLabel;
  final String lastActive;
}
