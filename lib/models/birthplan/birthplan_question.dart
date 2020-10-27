import 'package:json_annotation/json_annotation.dart';
part 'birthplan_question.g.dart';

@JsonSerializable()
class BirthplanQuestion {
  int id;
  @JsonKey(name: 'question_id')
  int questionId;
  String question;
  int order;

  BirthplanQuestion({this.id, this.questionId, this.question, this.order});
  factory BirthplanQuestion.fromJson(Map<String, dynamic> json) =>
      _$BirthplanQuestionFromJson(json);
  Map<String, dynamic> toJson() => _$BirthplanQuestionToJson(this);
}
