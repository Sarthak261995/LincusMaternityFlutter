// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_measurement_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMeasurementRequest _$UpdateMeasurementRequestFromJson(
    Map<String, dynamic> json) {
  return UpdateMeasurementRequest(
    datetime: json['datetime'] as String,
    appTimestamp: json['app_timestamp'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    photofilename: json['photofilename'] as String,
    comment: json['comment'] as String,
    measurements: (json['measurements'] as List)
        ?.map((e) => e == null
            ? null
            : UpdateMeasurementModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UpdateMeasurementRequestToJson(
        UpdateMeasurementRequest instance) =>
    <String, dynamic>{
      'datetime': instance.datetime,
      'app_timestamp': instance.appTimestamp,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'photofilename': instance.photofilename,
      'comment': instance.comment,
      'measurements': instance.measurements,
    };
