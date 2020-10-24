import '../sub_scores.dart';
import '../survey_answers.dart';
import 'package:json_annotation/json_annotation.dart';
part 'save_survey_request.g.dart';

@JsonSerializable()
class SaveSurveyRequest {
  int survey;
  String datetime;
  @JsonKey(name: 'app_timestamp')
  String appTimestamp;
  @JsonKey(defaultValue: 0)
  double latitude = 0;
  @JsonKey(defaultValue: 0)
  double longitude = 0;
  @JsonKey(defaultValue: 0)
  double score;
  String comment;
  @JsonKey(name: 'care_note')
  String careNote;
  @JsonKey(name: 'action_title', defaultValue: '')
  String actionTitle = '';
  @JsonKey(name: 'action_note', defaultValue: '')
  String actionNote = '';
  @JsonKey(name: 'action_priority', defaultValue: 1)
  int actionPriority = 1;
  @JsonKey(name: 'action_status', defaultValue: 'in_progress')
  String actionStatus = 'in_progress';
  @JsonKey(name: 'action_due')
  String actionDue;
  List<SurveyAnswers> answers;
  List<SubScores> subScores;

  SaveSurveyRequest(
      {this.survey,
      this.datetime,
      @JsonKey(name: 'subgroup_id') this.appTimestamp,
      this.latitude,
      this.longitude,
      this.score,
      this.comment,
      this.careNote,
      this.actionTitle,
      this.actionNote,
      this.actionPriority,
      this.actionStatus,
      this.actionDue,
      this.answers,
      this.subScores});
  factory SaveSurveyRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveSurveyRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SaveSurveyRequestToJson(this);
}
