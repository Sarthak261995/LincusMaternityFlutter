import 'package:json_annotation/json_annotation.dart';
part 'measurement_option_model.g.dart';

@JsonSerializable()
class MeasurementOptionModel {
  int id;
  String name;
  String icon;
  String units;
  String value;
  int manual;
  @JsonKey(name: 'default_lower_range')
  int defaultLowerRange;
  @JsonKey(name: 'default_upper_range')
  int defaultUpperRange;
  @JsonKey(name: 'override_range')
  int overrideRange;
  @JsonKey(name: 'override_goal')
  int overrideGoal;
  String guide;

  MeasurementOptionModel(
      {this.id,
      this.name,
      this.icon,
      this.units,
      this.manual,
      this.defaultLowerRange,
      this.defaultUpperRange,
      this.overrideRange,
      this.overrideGoal,
      this.guide});
  factory MeasurementOptionModel.fromJson(Map<String, dynamic> json) =>
      _$MeasurementOptionModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeasurementOptionModelToJson(this);
}
