// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyModel _$SurveyModelFromJson(Map<String, dynamic> json) {
  return SurveyModel(
    name: json['name'] as String,
    icon: json['icon'] as String,
    master: json['master'] as int,
    order: json['order'] as int,
    defaultOn: json['default_on'] as int,
    noOptional: json['no_optional'] as int,
    frequency: json['frequency'] as int,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$SurveyModelToJson(SurveyModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'master': instance.master,
      'order': instance.order,
      'default_on': instance.defaultOn,
      'no_optional': instance.noOptional,
      'frequency': instance.frequency,
      'id': instance.id,
    };
