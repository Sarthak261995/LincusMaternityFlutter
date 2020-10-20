import 'package:json_annotation/json_annotation.dart';
part 'update_measurement_model.g.dart';

@JsonSerializable()
class UpdateMeasurementModel {
  int type;
  double value;

  UpdateMeasurementModel({this.type, this.value});
  factory UpdateMeasurementModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateMeasurementModelFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateMeasurementModelToJson(this);
}
