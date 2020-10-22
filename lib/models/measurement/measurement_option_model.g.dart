// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasurementOptionModel _$MeasurementOptionModelFromJson(
    Map<String, dynamic> json) {
  return MeasurementOptionModel(
    id: json['id'] as int,
    name: json['name'] as String,
    icon: json['icon'] as String,
    units: json['units'] as String,
    manual: json['manual'] as int,
    defaultLowerRange: json['default_lower_range'] as int,
    defaultUpperRange: json['default_upper_range'] as int,
    overrideRange: json['override_range'] as int,
    overrideGoal: json['override_goal'] as int,
    guide: json['guide'] as String,
  )..value = json['value'] as String;
}

Map<String, dynamic> _$MeasurementOptionModelToJson(
        MeasurementOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'units': instance.units,
      'value': instance.value,
      'manual': instance.manual,
      'default_lower_range': instance.defaultLowerRange,
      'default_upper_range': instance.defaultUpperRange,
      'override_range': instance.overrideRange,
      'override_goal': instance.overrideGoal,
      'guide': instance.guide,
    };
