import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_event_model.freezed.dart';
part 'history_event_model.g.dart';

@freezed
abstract class HistoryEventModel with _$HistoryEventModel {
  const factory HistoryEventModel({
    required String id,
    required String date,
    required int year,
    required String title,
    required String description,
    required String image,
    required String country,
  }) = _HistoryEventModel;

  factory HistoryEventModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryEventModelFromJson(json);
}
