// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderBoard _$LeaderBoardFromJson(Map<String, dynamic> json) => LeaderBoard(
      json['team'] == null
          ? null
          : Team.fromJson(json['team'] as Map<String, dynamic>),
      (json['leaderboard'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaderBoardToJson(LeaderBoard instance) =>
    <String, dynamic>{
      'leaderboard': instance.leaderboard.map((e) => e.toJson()).toList(),
      'team': instance.team?.toJson(),
    };
