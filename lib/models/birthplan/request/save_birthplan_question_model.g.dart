// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_birthplan_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveBirthplanQuestionModel _$SaveBirthplanQuestionModelFromJson(
    Map<String, dynamic> json) {
  return SaveBirthplanQuestionModel(
    questionId: json['question_id'] as int,
    textarea: json['textarea'] as String,
    checked: json['checked'] as int,
  );
}

Map<String, dynamic> _$SaveBirthplanQuestionModelToJson(
        SaveBirthplanQuestionModel instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'textarea': instance.textarea,
      'checked': instance.checked,
    };
