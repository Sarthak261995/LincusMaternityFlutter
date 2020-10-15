import 'package:json_annotation/json_annotation.dart';
import '../wellbeing_score.dart';
part 'get_wellbeing_score_response.g.dart';

@JsonSerializable()
class GetWellbeingScoreResponse {
  int status;
  String message;
  WellBeingScore data;
  GetWellbeingScoreResponse({this.status, this.message, this.data});
  factory GetWellbeingScoreResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWellbeingScoreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetWellbeingScoreResponseToJson(this);
}
