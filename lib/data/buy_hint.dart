import 'package:json_annotation/json_annotation.dart';

part 'buy_hint.g.dart';

@JsonSerializable()
class BuyHint {
  BuyHint(this.questionGroupId, this.seq);
  String questionGroupId;
  int seq;

  factory BuyHint.fromJson(Map<String, dynamic> json) =>
      _$BuyHintFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$BuyHintToJson(this);
}
