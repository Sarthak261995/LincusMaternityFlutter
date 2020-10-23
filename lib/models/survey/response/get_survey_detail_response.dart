import 'package:json_annotation/json_annotation.dart';
import 'package:lincus_maternity/models/survey/survey_detail.dart';
part 'get_survey_detail_response.g.dart';

@JsonSerializable()
class GetSurveyDetailResponse {
  int status;
  String message;
  SurveyDetail data;

  GetSurveyDetailResponse({this.status, this.message, this.data});
  factory GetSurveyDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSurveyDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetSurveyDetailResponseToJson(this);
}
