import 'package:json_annotation/json_annotation.dart';

import '../birthplan_question_details.dart';
part 'get_birthplan_question_response.g.dart';

@JsonSerializable()
class GetBirthplanQuestionResponse {
  int status;
  String message;
  List<BirthplanQuestionDetails> data;

  GetBirthplanQuestionResponse({this.status, this.message, this.data});
  factory GetBirthplanQuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBirthplanQuestionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetBirthplanQuestionResponseToJson(this);
}
