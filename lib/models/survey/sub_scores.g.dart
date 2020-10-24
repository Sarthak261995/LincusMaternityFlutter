// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_scores.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubScores _$SubScoresFromJson(Map<String, dynamic> json) {
  return SubScores(
    subgroupId: json['subgroup_id'] as int,
    score: json['score'] as int,
  );
}

Map<String, dynamic> _$SubScoresToJson(SubScores instance) => <String, dynamic>{
      'subgroup_id': instance.subgroupId,
      'score': instance.score,
    };
