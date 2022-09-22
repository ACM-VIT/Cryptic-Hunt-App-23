import 'package:json_annotation/json_annotation.dart';

part 'question_group.g.dart';

@JsonSerializable()
class QuestionGroup {
  QuestionGroup(this.name, this.id, this.description, this.isSequence,
      this.numQuestionsSolvedQuestionGroup, this.numberOfQuestions);

  String name;
  String id;
  int numberOfQuestions;
  String description;
  bool isSequence;
  int numQuestionsSolvedQuestionGroup;

  factory QuestionGroup.fromJson(Map<String, dynamic> json) =>
      _$QuestionGroupFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionGroupToJson(this);
}
