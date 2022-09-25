// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phase _$PhaseFromJson(Map<String, dynamic> json) => Phase(
      json['changeTrigger'] as int,
      json['currentPhase'] as int,
      json['mainText'] as String,
      json['phaseText'] as String,
      json['time'] as String,
    );

Map<String, dynamic> _$PhaseToJson(Phase instance) => <String, dynamic>{
      'currentPhase': instance.currentPhase,
      'changeTrigger': instance.changeTrigger,
      'phaseText': instance.phaseText,
      'mainText': instance.mainText,
      'time': instance.time,
    };
