// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_answers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyAnswers _$SurveyAnswersFromJson(Map<String, dynamic> json) {
  return SurveyAnswers(
    question: json['question'] as int,
    answer: json['answer'] as int,
  );
}

Map<String, dynamic> _$SurveyAnswersToJson(SurveyAnswers instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answer': instance.answer,
    };
