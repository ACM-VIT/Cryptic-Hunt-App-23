import 'package:json_annotation/json_annotation.dart';

part 'phase.g.dart';

@JsonSerializable()
class Phase {
  Phase(this.changeTrigger, this.currentPhase, this.mainText, this.phaseText,
      this.time);
  int currentPhase;
  int changeTrigger;
  String phaseText;
  String mainText;
  String time;

  factory Phase.fromJson(Map<String, dynamic> json) => _$PhaseFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PhaseToJson(this);
}
