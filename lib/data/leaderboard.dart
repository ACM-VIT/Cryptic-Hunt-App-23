import 'package:cryptic_hunt/data/team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leaderboard.g.dart';

@JsonSerializable(explicitToJson: true)
class LeaderBoard {
  LeaderBoard(this.team, this.leaderboard);

  List<Team> leaderboard;
  Team? team;

  factory LeaderBoard.fromJson(Map<String, dynamic> json) =>
      _$LeaderBoardFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$LeaderBoardToJson(this);
}
