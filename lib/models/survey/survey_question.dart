import 'package:json_annotation/json_annotation.dart';
part 'survey_question.g.dart';

@JsonSerializable()
class SurveyQuestions {
  String question;
  int start;
  int sentiment;
  @JsonKey(name: 'slider_max')
  int sliderMax;
  int subgroup;
  int optional;
  String icon;
  int id;

  SurveyQuestions(
      {this.question,
      this.start,
      this.sentiment,
      this.sliderMax,
      this.subgroup,
      this.optional,
      this.icon,
      this.id});
  factory SurveyQuestions.fromJson(Map<String, dynamic> json) =>
      _$SurveyQuestionsFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyQuestionsToJson(this);
}
