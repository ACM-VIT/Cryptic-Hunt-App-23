// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_group_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionGroupDetail _$QuestionGroupDetailFromJson(Map<String, dynamic> json) =>
    QuestionGroupDetail(
      json['name'] as String,
      json['id'] as String,
      json['description'] as String,
      json['isSequence'] as bool,
      json['numQuestionsSolvedQuestionGroup'] as int? ?? 0,
      json['numberOfQuestions'] as int,
    )..questions = (json['questions'] as List<dynamic>?)
        ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$QuestionGroupDetailToJson(
        QuestionGroupDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'numberOfQuestions': instance.numberOfQuestions,
      'description': instance.description,
      'isSequence': instance.isSequence,
      'numQuestionsSolvedQuestionGroup':
          instance.numQuestionsSolvedQuestionGroup,
      'questions': instance.questions?.map((e) => e.toJson()).toList(),
    };
