// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_latest_measurement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetLatestMeasurementResponse _$GetLatestMeasurementResponseFromJson(
    Map<String, dynamic> json) {
  return GetLatestMeasurementResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : MeasurementModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetLatestMeasurementResponseToJson(
        GetLatestMeasurementResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
