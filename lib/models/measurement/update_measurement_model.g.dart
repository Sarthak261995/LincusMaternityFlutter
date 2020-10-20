// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_measurement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMeasurementModel _$UpdateMeasurementModelFromJson(
    Map<String, dynamic> json) {
  return UpdateMeasurementModel(
    type: json['type'] as int,
    value: (json['value'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$UpdateMeasurementModelToJson(
        UpdateMeasurementModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };
