// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderBoard _$LeaderBoardFromJson(Map<String, dynamic> json) => LeaderBoard(
      json['currentTeam'] == null
          ? null
          : Team.fromJson(json['currentTeam'] as Map<String, dynamic>),
      (json['topTeams'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaderBoardToJson(LeaderBoard instance) =>
    <String, dynamic>{
      'topTeams': instance.topTeams.map((e) => e.toJson()).toList(),
      'currentTeam': instance.currentTeam?.toJson(),
    };
