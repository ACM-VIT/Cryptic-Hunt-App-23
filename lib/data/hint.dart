import 'package:json_annotation/json_annotation.dart';

part 'hint.g.dart';

@JsonSerializable()
class Hint {
  Hint(this.answer, this.questionGroupId, this.seq);
  String answer;
  String questionGroupId;
  int seq;

  factory Hint.fromJson(Map<String, dynamic> json) => _$HintFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$HintToJson(this);
}
