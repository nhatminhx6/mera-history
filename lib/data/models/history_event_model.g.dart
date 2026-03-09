// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryEventModel _$HistoryEventModelFromJson(Map<String, dynamic> json) =>
    _HistoryEventModel(
      id: json['id'] as String,
      date: json['date'] as String,
      year: (json['year'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      country: json['country'] as String,
    );

Map<String, dynamic> _$HistoryEventModelToJson(_HistoryEventModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'year': instance.year,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'country': instance.country,
    };
