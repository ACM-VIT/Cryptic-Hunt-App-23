import 'package:json_annotation/json_annotation.dart';
import 'user.dart';

part 'team.g.dart';

@JsonSerializable(explicitToJson: true)
class Team {
  Team(
    this.id,
    this.name,
    this.teamcode,
    this.teamLeaderId,
    this.createdAt,
    this.updatedAt,
    this.points,
    this.members,
    this.rank,
  );

  String id;
  String name;
  String teamcode;
  String teamLeaderId;
  String createdAt;
  String updatedAt;
  int points;
  List<User>? members;
  @JsonKey(defaultValue: 0)
  int rank;

  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);
  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
