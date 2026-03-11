import 'package:mera_history/data/repositories/profile_stats_repository.dart';
import 'package:mera_history/features/profile/models/profile_models.dart';
import 'package:mera_history/features/saved/repository/saved_repository.dart';

abstract class ProfileRepository {
  Future<ProfileOverviewModel> loadProfile();
}

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({
    required this.profileStatsRepository,
    required this.savedRepository,
  });

  final ProfileStatsRepository profileStatsRepository;
  final SavedRepository savedRepository;

  @override
  Future<ProfileOverviewModel> loadProfile() async {
    final stats = await profileStatsRepository.getProfileStats();
    final savedEvents = await savedRepository.savedEvents();
    final savedFigures = await savedRepository.savedFigures();
    final bookmarks = savedEvents.length + savedFigures.length;

    return ProfileOverviewModel(
      displayName: stats.displayName,
      bookmarkCount: bookmarks > 0 ? bookmarks : stats.bookmarkCount,
      readingStreak: stats.readingStreak,
      themeLabel: _themeLabel(stats.themePreference),
      lastActive: stats.lastActive,
    );
  }

  String _themeLabel(String value) {
    return switch (value) {
      'darkImperial' => 'Dark Imperial',
      'darkJade' => 'Dark Jade',
      'darkScholar' => 'Dark Scholar',
      'ancientBronze' => 'Ancient Bronze',
      'darkCrimson' => 'Dark Crimson',
      'midnightBlue' => 'Midnight Blue',
      'obsidianGold' => 'Obsidian Gold',
      'deepForest' => 'Deep Forest',
      _ => value,
    };
  }
}
