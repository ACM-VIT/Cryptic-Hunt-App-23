import 'package:json_annotation/json_annotation.dart';

part 'answer.g.dart';

@JsonSerializable()
class Answer {
  Answer(this.answer, this.questionGroupId, this.seq);
  String answer;
  String questionGroupId;
  int seq;

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}
