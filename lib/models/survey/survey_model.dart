import 'package:json_annotation/json_annotation.dart';
part 'survey_model.g.dart';

@JsonSerializable()
class SurveyModel {
  String name;
  String icon;
  int master;
  int order;
  @JsonKey(name: 'default_on')
  int defaultOn;
  @JsonKey(name: 'no_optional')
  int noOptional;
  int frequency;
  int id;

  SurveyModel(
      {this.name,
      this.icon,
      this.master,
      this.order,
      this.defaultOn,
      this.noOptional,
      this.frequency,
      this.id});
  factory SurveyModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyModelFromJson(json);
  Map<String, dynamic> toJson() => _$SurveyModelToJson(this);
}
