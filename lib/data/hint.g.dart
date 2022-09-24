// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hint _$HintFromJson(Map<String, dynamic> json) => Hint(
      json['hint'] as String,
      json['teamId'] as String,
      json['questionSeq'] as int,
      json['questionGroupId'] as String,
    );

Map<String, dynamic> _$HintToJson(Hint instance) => <String, dynamic>{
      'teamId': instance.teamId,
      'questionGroupId': instance.questionGroupId,
      'questionSeq': instance.questionSeq,
      'hint': instance.hint,
    };
