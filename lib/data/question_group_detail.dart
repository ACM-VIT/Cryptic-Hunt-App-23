import 'package:json_annotation/json_annotation.dart';
import 'question.dart';
part 'question_group_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class QuestionGroupDetail {
  QuestionGroupDetail(this.name, this.id, this.description, this.isSequence,
      this.numQuestionsSolvedQuestionGroup, this.numberOfQuestions);

  String name;
  String id;
  int numberOfQuestions;
  String description;
  bool isSequence;
  int numQuestionsSolvedQuestionGroup;
  List<Question>? questions;

  factory QuestionGroupDetail.fromJson(Map<String, dynamic> json) =>
      _$QuestionGroupDetailFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionGroupDetailToJson(this);
}
