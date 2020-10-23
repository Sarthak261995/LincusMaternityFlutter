// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyDetail _$SurveyDetailFromJson(Map<String, dynamic> json) {
  return SurveyDetail(
    name: json['name'] as String,
    icon: json['icon'] as String,
    defaultOn: json['default_on'] as int,
    noOptional: json['no_optional'] as int,
    frequency: json['frequency'] as int ?? 0,
    questions: (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : SurveyQuestions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$SurveyDetailToJson(SurveyDetail instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'default_on': instance.defaultOn,
      'no_optional': instance.noOptional,
      'frequency': instance.frequency,
      'questions': instance.questions,
      'id': instance.id,
    };
