// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionGroup _$QuestionGroupFromJson(Map<String, dynamic> json) =>
    QuestionGroup(
      json['name'] as String,
      json['id'] as String,
      json['description'] as String,
      json['isSequence'] as bool,
      json['numQuestionsSolvedQuestionGroup'] as int,
      json['numberOfQuestions'] as int,
    );

Map<String, dynamic> _$QuestionGroupToJson(QuestionGroup instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'numberOfQuestions': instance.numberOfQuestions,
      'description': instance.description,
      'isSequence': instance.isSequence,
      'numQuestionsSolvedQuestionGroup':
          instance.numQuestionsSolvedQuestionGroup,
    };
