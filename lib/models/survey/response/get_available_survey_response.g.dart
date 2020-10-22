// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_available_survey_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAvailableSurveyResponse _$GetAvailableSurveyResponseFromJson(
    Map<String, dynamic> json) {
  return GetAvailableSurveyResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) =>
            e == null ? null : SurveyModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetAvailableSurveyResponseToJson(
        GetAvailableSurveyResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
