// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pregnancy_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPregnancyDetailResponse _$GetPregnancyDetailResponseFromJson(
    Map<String, dynamic> json) {
  return GetPregnancyDetailResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : PregnancyDetails.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetPregnancyDetailResponseToJson(
        GetPregnancyDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
