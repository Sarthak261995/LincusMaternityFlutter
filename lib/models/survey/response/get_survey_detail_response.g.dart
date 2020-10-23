// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_survey_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSurveyDetailResponse _$GetSurveyDetailResponseFromJson(
    Map<String, dynamic> json) {
  return GetSurveyDetailResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : SurveyDetail.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetSurveyDetailResponseToJson(
        GetSurveyDetailResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
