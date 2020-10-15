// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellbeing_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WellBeingScore _$WellBeingScoreFromJson(Map<String, dynamic> json) {
  return WellBeingScore(
    wellbeingScore: (json['wellbeing_score'] as num)?.toDouble(),
    lastDate: json['last_date'] as String,
  );
}

Map<String, dynamic> _$WellBeingScoreToJson(WellBeingScore instance) =>
    <String, dynamic>{
      'wellbeing_score': instance.wellbeingScore,
      'last_date': instance.lastDate,
    };
