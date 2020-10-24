// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_survey_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveSurveyRequest _$SaveSurveyRequestFromJson(Map<String, dynamic> json) {
  return SaveSurveyRequest(
    survey: json['survey'] as int,
    datetime: json['datetime'] as String,
    appTimestamp: json['app_timestamp'] as String,
    latitude: (json['latitude'] as num)?.toDouble() ?? 0,
    longitude: (json['longitude'] as num)?.toDouble() ?? 0,
    score: (json['score'] as num)?.toDouble() ?? 0,
    comment: json['comment'] as String,
    careNote: json['care_note'] as String,
    actionTitle: json['action_title'] as String ?? '',
    actionNote: json['action_note'] as String ?? '',
    actionPriority: json['action_priority'] as int ?? 1,
    actionStatus: json['action_status'] as String ?? 'in_progress',
    actionDue: json['action_due'] as String,
    answers: (json['answers'] as List)
        ?.map((e) => e == null
            ? null
            : SurveyAnswers.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subScores: (json['subScores'] as List)
        ?.map((e) =>
            e == null ? null : SubScores.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SaveSurveyRequestToJson(SaveSurveyRequest instance) =>
    <String, dynamic>{
      'survey': instance.survey,
      'datetime': instance.datetime,
      'app_timestamp': instance.appTimestamp,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'score': instance.score,
      'comment': instance.comment,
      'care_note': instance.careNote,
      'action_title': instance.actionTitle,
      'action_note': instance.actionNote,
      'action_priority': instance.actionPriority,
      'action_status': instance.actionStatus,
      'action_due': instance.actionDue,
      'answers': instance.answers,
      'subScores': instance.subScores,
    };
