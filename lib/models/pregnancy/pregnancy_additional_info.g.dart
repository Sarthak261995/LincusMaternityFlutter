// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy_additional_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyAdditionalInfo _$PregnancyAdditionalInfoFromJson(
    Map<String, dynamic> json) {
  return PregnancyAdditionalInfo(
    daysIn: json['days_in'] as int,
    daysLeft: json['days_left'] as int,
    weeksIn: json['weeks_in'] as int,
    weekDevelopment: json['week_development'] == null
        ? null
        : WeekDevelopment.fromJson(
            json['week_development'] as Map<String, dynamic>),
    trimester: json['trimester'] as int,
  );
}

Map<String, dynamic> _$PregnancyAdditionalInfoToJson(
        PregnancyAdditionalInfo instance) =>
    <String, dynamic>{
      'days_in': instance.daysIn,
      'days_left': instance.daysLeft,
      'weeks_in': instance.weeksIn,
      'week_development': instance.weekDevelopment,
      'trimester': instance.trimester,
    };
