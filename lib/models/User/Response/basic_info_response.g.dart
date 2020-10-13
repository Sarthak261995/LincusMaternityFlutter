// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicInfoResponse _$BasicInfoResponseFromJson(Map<String, dynamic> json) {
  return BasicInfoResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : UserBasicInfo.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BasicInfoResponseToJson(BasicInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
