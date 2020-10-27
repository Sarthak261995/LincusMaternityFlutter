// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birthplan_question_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BirthplanQuestionDetails _$BirthplanQuestionDetailsFromJson(
    Map<String, dynamic> json) {
  return BirthplanQuestionDetails(
    id: json['id'] as int,
    sectionId: json['section_id'] as int,
    sectionName: json['section_name'] as String,
    question: json['question'] as String,
    text: json['text'] as String,
    hasTextarea: json['has_textarea'] as int,
    textareaName: json['textarea_name'] as String,
    order: json['order'] as int,
    radioType: json['radio_type'] as String,
    questions: (json['questions'] as List)
        ?.map((e) => e == null
            ? null
            : BirthplanQuestion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..comment = json['comment'] as String
    ..selectedIndex = json['selectedIndex'] as int;
}

Map<String, dynamic> _$BirthplanQuestionDetailsToJson(
        BirthplanQuestionDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section_id': instance.sectionId,
      'section_name': instance.sectionName,
      'question': instance.question,
      'text': instance.text,
      'has_textarea': instance.hasTextarea,
      'textarea_name': instance.textareaName,
      'order': instance.order,
      'radio_type': instance.radioType,
      'questions': instance.questions,
      'comment': instance.comment,
      'selectedIndex': instance.selectedIndex,
    };
