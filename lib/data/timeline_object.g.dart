// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeline_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimelineObject _$TimelineObjectFromJson(Map<String, dynamic> json) =>
    TimelineObject(
      json['startTime'] as String,
      json['subTitle'] as String?,
      json['numHours'] as int,
      json['title'] as String,
    );

Map<String, dynamic> _$TimelineObjectToJson(TimelineObject instance) =>
    <String, dynamic>{
      'startTime': instance.startTime,
      'title': instance.title,
      'subTitle': instance.subTitle,
      'numHours': instance.numHours,
    };
