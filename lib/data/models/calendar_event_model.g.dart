// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CalendarEventModel _$CalendarEventModelFromJson(Map<String, dynamic> json) =>
    _CalendarEventModel(
      date: json['date'] as String,
      lunarDate: json['lunarDate'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$CalendarEventModelToJson(_CalendarEventModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'lunarDate': instance.lunarDate,
      'label': instance.label,
    };
