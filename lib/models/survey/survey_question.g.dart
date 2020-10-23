// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyQuestions _$SurveyQuestionsFromJson(Map<String, dynamic> json) {
  return SurveyQuestions(
    question: json['question'] as String,
    start: json['start'] as int,
    sentiment: json['sentiment'] as int,
    sliderMax: json['slider_max'] as int,
    subgroup: json['subgroup'] as int,
    optional: json['optional'] as int,
    icon: json['icon'] as String,
    id: json['id'] as int,
  );
}

Map<String, dynamic> _$SurveyQuestionsToJson(SurveyQuestions instance) =>
    <String, dynamic>{
      'question': instance.question,
      'start': instance.start,
      'sentiment': instance.sentiment,
      'slider_max': instance.sliderMax,
      'subgroup': instance.subgroup,
      'optional': instance.optional,
      'icon': instance.icon,
      'id': instance.id,
    };
