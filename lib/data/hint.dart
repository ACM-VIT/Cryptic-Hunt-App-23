import 'package:json_annotation/json_annotation.dart';

part 'hint.g.dart';

@JsonSerializable()
class Hint {
  Hint(this.hint, this.teamId, this.questionSeq, this.questionGroupId);
  String teamId;
  String questionGroupId;
  int questionSeq;
  String hint;

  factory Hint.fromJson(Map<String, dynamic> json) => _$HintFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$HintToJson(this);
}
