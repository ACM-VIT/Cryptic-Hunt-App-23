import 'package:json_annotation/json_annotation.dart';

part 'submission.g.dart';

@JsonSerializable()
class Submission {
  Submission(this.isCorrect);
  bool isCorrect;

  factory Submission.fromJson(Map<String, dynamic> json) =>
      _$SubmissionFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$SubmissionToJson(this);
}
