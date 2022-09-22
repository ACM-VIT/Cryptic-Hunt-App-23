import 'package:json_annotation/json_annotation.dart';

part 'question.g.dart';

@JsonSerializable()
class Question {
  Question(this.hint, this.description, this.title, this.costOfHint,
      this.pointsAwarded, this.solved, this.seq);
  String? hint;
  String description, title;
  int? costOfHint;
  int pointsAwarded, seq;
  bool solved;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
