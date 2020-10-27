import 'package:json_annotation/json_annotation.dart';
part 'save_birthplan_question_model.g.dart';

@JsonSerializable()
class SaveBirthplanQuestionModel {
  @JsonKey(name: 'question_id')
  int questionId;
  String textarea;
  int checked;

  SaveBirthplanQuestionModel({this.questionId, this.textarea, this.checked});
  factory SaveBirthplanQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$SaveBirthplanQuestionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SaveBirthplanQuestionModelToJson(this);
}
