// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_wellbeing_score_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetWellbeingScoreResponse _$GetWellbeingScoreResponseFromJson(
    Map<String, dynamic> json) {
  return GetWellbeingScoreResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: json['data'] == null
        ? null
        : WellBeingScore.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetWellbeingScoreResponseToJson(
        GetWellbeingScoreResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
