// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hint _$HintFromJson(Map<String, dynamic> json) => Hint(
      json['answer'] as String,
      json['questionGroupId'] as String,
      json['seq'] as int,
    );

Map<String, dynamic> _$HintToJson(Hint instance) => <String, dynamic>{
      'answer': instance.answer,
      'questionGroupId': instance.questionGroupId,
      'seq': instance.seq,
    };
