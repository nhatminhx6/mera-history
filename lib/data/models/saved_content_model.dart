class SavedContentModel {
  const SavedContentModel({
    required this.id,
    required this.savedEventIds,
    required this.savedFigureIds,
    required this.readingHistory,
  });

  final String id;
  final List<String> savedEventIds;
  final List<String> savedFigureIds;
  final List<ReadingHistoryEntryModel> readingHistory;

  factory SavedContentModel.fromJson(Map<String, dynamic> json) {
    return SavedContentModel(
      id: json['_id'] as String,
      savedEventIds: (json['savedEventIds'] as List<dynamic>)
          .map((id) => id.toString())
          .toList(),
      savedFigureIds: (json['savedFigureIds'] as List<dynamic>)
          .map((id) => id.toString())
          .toList(),
      readingHistory: (json['readingHistory'] as List<dynamic>)
          .map(
            (item) => ReadingHistoryEntryModel.fromJson(
              Map<String, dynamic>.from(item as Map),
            ),
          )
          .toList(),
    );
  }
}

class ReadingHistoryEntryModel {
  const ReadingHistoryEntryModel({
    required this.id,
    required this.title,
    required this.time,
    this.eventId,
    this.figureId,
  });

  final String id;
  final String title;
  final String time;
  final String? eventId;
  final String? figureId;

  factory ReadingHistoryEntryModel.fromJson(Map<String, dynamic> json) {
    return ReadingHistoryEntryModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      time: json['time'] as String,
      eventId: json['eventId'] as String?,
      figureId: json['figureId'] as String?,
    );
  }
}
