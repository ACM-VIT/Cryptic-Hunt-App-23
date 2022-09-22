// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      json['hint'] as String?,
      json['description'] as String,
      json['title'] as String,
      json['costOfHint'] as int?,
      json['pointsAwarded'] as int,
      json['solved'] as bool,
      json['seq'] as int,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'hint': instance.hint,
      'description': instance.description,
      'title': instance.title,
      'costOfHint': instance.costOfHint,
      'pointsAwarded': instance.pointsAwarded,
      'seq': instance.seq,
      'solved': instance.solved,
    };
