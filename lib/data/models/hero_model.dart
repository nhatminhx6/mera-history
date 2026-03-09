import 'package:freezed_annotation/freezed_annotation.dart';

part 'hero_model.freezed.dart';
part 'hero_model.g.dart';

@freezed
abstract class HeroModel with _$HeroModel {
  const factory HeroModel({
    required int id,
    required String name,
    required int born,
    required int died,
    required String description,
    required String image,
    required String role,
    required String period,
  }) = _HeroModel;

  factory HeroModel.fromJson(Map<String, dynamic> json) =>
      _$HeroModelFromJson(json);
}
