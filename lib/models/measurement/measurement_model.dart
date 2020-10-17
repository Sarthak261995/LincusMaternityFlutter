import 'package:json_annotation/json_annotation.dart';
part 'measurement_model.g.dart';

@JsonSerializable()
class MeasurementModel {
  int index;
  String type;
  String icon;
  @JsonKey(defaultValue: '')
  String units;
  @JsonKey(defaultValue: 0)
  int value;
  int userID;
  @JsonKey(name: 'bm_id')
  int bmId;
  int manual;
  @JsonKey(name: 'override_goal')
  int overrideGoal;
  double goal;
  String timestamp;
  String datetime;

  MeasurementModel(
      {this.index,
      this.type,
      this.icon,
      this.units,
      this.value,
      this.userID,
      this.bmId,
      this.manual,
      this.overrideGoal,
      this.goal,
      this.timestamp,
      this.datetime});
  factory MeasurementModel.fromJson(Map<String, dynamic> json) =>
      _$MeasurementModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeasurementModelToJson(this);
}
