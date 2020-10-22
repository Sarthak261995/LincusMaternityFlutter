import 'package:json_annotation/json_annotation.dart';

import '../survey_model.dart';
part 'get_available_survey_response.g.dart';

@JsonSerializable()
class GetAvailableSurveyResponse {
  int status;
  String message;
  List<SurveyModel> data;

  GetAvailableSurveyResponse({this.status, this.message, this.data});
  factory GetAvailableSurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAvailableSurveyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetAvailableSurveyResponseToJson(this);
}
