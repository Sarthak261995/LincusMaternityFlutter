// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birthplan_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BirthplanQuestion _$BirthplanQuestionFromJson(Map<String, dynamic> json) {
  return BirthplanQuestion(
    id: json['id'] as int,
    questionId: json['question_id'] as int,
    question: json['question'] as String,
    order: json['order'] as int,
  );
}

Map<String, dynamic> _$BirthplanQuestionToJson(BirthplanQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question_id': instance.questionId,
      'question': instance.question,
      'order': instance.order,
    };
