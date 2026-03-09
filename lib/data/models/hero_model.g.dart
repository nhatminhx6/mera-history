// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hero_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HeroModel _$HeroModelFromJson(Map<String, dynamic> json) => _HeroModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  born: (json['born'] as num).toInt(),
  died: (json['died'] as num).toInt(),
  description: json['description'] as String,
  image: json['image'] as String,
  role: json['role'] as String,
  period: json['period'] as String,
);

Map<String, dynamic> _$HeroModelToJson(_HeroModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'born': instance.born,
      'died': instance.died,
      'description': instance.description,
      'image': instance.image,
      'role': instance.role,
      'period': instance.period,
    };
