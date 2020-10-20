// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measurement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasurementModel _$MeasurementModelFromJson(Map<String, dynamic> json) {
  return MeasurementModel(
    index: json['index'] as int,
    type: json['type'] as String,
    icon: json['icon'] as String,
    units: json['units'] as String ?? '',
    value: (json['value'] as num)?.toDouble() ?? 0,
    userID: json['userID'] as int,
    bmId: json['bm_id'] as int,
    manual: json['manual'] as int,
    overrideGoal: json['override_goal'] as int,
    goal: (json['goal'] as num)?.toDouble(),
    timestamp: json['timestamp'] as String,
    datetime: json['datetime'] as String,
  );
}

Map<String, dynamic> _$MeasurementModelToJson(MeasurementModel instance) =>
    <String, dynamic>{
      'index': instance.index,
      'type': instance.type,
      'icon': instance.icon,
      'units': instance.units,
      'value': instance.value,
      'userID': instance.userID,
      'bm_id': instance.bmId,
      'manual': instance.manual,
      'override_goal': instance.overrideGoal,
      'goal': instance.goal,
      'timestamp': instance.timestamp,
      'datetime': instance.datetime,
    };
