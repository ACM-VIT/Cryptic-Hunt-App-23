// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      json['id'] as String,
      json['name'] as String,
      json['teamcode'] as String,
      json['teamLeaderId'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['points'] as int,
      (json['members'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['rank'] as int,
    );

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'teamcode': instance.teamcode,
      'teamLeaderId': instance.teamLeaderId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'points': instance.points,
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'rank': instance.rank,
    };
