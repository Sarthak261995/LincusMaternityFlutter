// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_measurement_option_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMeasurementOptionResponse _$GetMeasurementOptionResponseFromJson(
    Map<String, dynamic> json) {
  return GetMeasurementOptionResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : MeasurementOptionModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetMeasurementOptionResponseToJson(
        GetMeasurementOptionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
