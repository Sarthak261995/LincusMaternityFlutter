import 'package:lincus_maternity/models/survey/survey_question.dart';
import 'package:json_annotation/json_annotation.dart';
part 'survey_detail.g.dart';

@JsonSerializable()
class SurveyDetail {
  String name;
  String icon;
  @JsonKey(name: 'default_on')
  int defaultOn;
  @JsonKey(name: 'no_optional')
  int noOptional;
  @JsonKey(defaultValue: 0)
  int frequency;
  List<SurveyQuestions> questions;
  int id;

  SurveyDetail(
      {this.name,
      this.icon,
      this.defaultOn,
      this.noOptional,
      this.frequency,
      this.questions,
      this.id});
  factory SurveyDetail.fromJson(Map<String, dynamic> json) =>
      _$SurveyDetailFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyDetailToJson(this);
}
