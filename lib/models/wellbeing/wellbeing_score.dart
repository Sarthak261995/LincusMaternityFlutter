import 'package:json_annotation/json_annotation.dart';
part 'wellbeing_score.g.dart';

@JsonSerializable()
class WellBeingScore {
  @JsonKey(name: 'wellbeing_score')
  double wellbeingScore;
  @JsonKey(name: 'last_date')
  String lastDate;

  WellBeingScore({this.wellbeingScore, this.lastDate});
  factory WellBeingScore.fromJson(Map<String, dynamic> json) =>
      _$WellBeingScoreFromJson(json);
  Map<String, dynamic> toJson() => _$WellBeingScoreToJson(this);
}
