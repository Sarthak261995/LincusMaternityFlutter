import 'package:json_annotation/json_annotation.dart';
part 'survey_answers.g.dart';

@JsonSerializable()
class SurveyAnswers {
  int question;
  int answer;

  SurveyAnswers({this.question, this.answer});
  factory SurveyAnswers.fromJson(Map<String, dynamic> json) =>
      _$SurveyAnswersFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyAnswersToJson(this);
}
