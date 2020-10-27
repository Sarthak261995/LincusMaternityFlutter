// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_birthplan_question_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBirthplanQuestionResponse _$GetBirthplanQuestionResponseFromJson(
    Map<String, dynamic> json) {
  return GetBirthplanQuestionResponse(
    status: json['status'] as int,
    message: json['message'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : BirthplanQuestionDetails.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GetBirthplanQuestionResponseToJson(
        GetBirthplanQuestionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
