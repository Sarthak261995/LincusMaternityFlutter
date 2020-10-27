import 'package:json_annotation/json_annotation.dart';

import 'birthplan_question.dart';
part 'birthplan_question_details.g.dart';

@JsonSerializable()
class BirthplanQuestionDetails {
  int id;
  @JsonKey(name: 'section_id')
  int sectionId;
  @JsonKey(name: 'section_name')
  String sectionName;
  String question;
  String text;
  @JsonKey(name: 'has_textarea')
  int hasTextarea;
  @JsonKey(name: 'textarea_name')
  String textareaName;
  int order;
  @JsonKey(name: 'radio_type')
  String radioType;
  List<BirthplanQuestion> questions;
  String comment = '';
  int selectedIndex = -1;

  BirthplanQuestionDetails(
      {this.id,
      this.sectionId,
      this.sectionName,
      this.question,
      this.text,
      this.hasTextarea,
      this.textareaName,
      this.order,
      this.radioType,
      this.questions});
  factory BirthplanQuestionDetails.fromJson(Map<String, dynamic> json) =>
      _$BirthplanQuestionDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$BirthplanQuestionDetailsToJson(this);
}
