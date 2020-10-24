import 'package:json_annotation/json_annotation.dart';
part 'sub_scores.g.dart';

@JsonSerializable()
class SubScores {
  @JsonKey(name: 'subgroup_id')
  int subgroupId;
  int score;

  SubScores({this.subgroupId, this.score});
  factory SubScores.fromJson(Map<String, dynamic> json) =>
      _$SubScoresFromJson(json);
  Map<String, dynamic> toJson() => _$SubScoresToJson(this);
}
