import 'package:lincus_maternity/models/measurement/update_measurement_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'update_measurement_request.g.dart';

@JsonSerializable()
class UpdateMeasurementRequest {
  String datetime;
  @JsonKey(name: 'app_timestamp')
  String appTimestamp;
  double latitude;
  double longitude;
  String photofilename;
  String comment;
  List<UpdateMeasurementModel> measurements;

  UpdateMeasurementRequest(
      {this.datetime,
      this.appTimestamp,
      this.latitude,
      this.longitude,
      this.photofilename,
      this.comment,
      this.measurements});
  factory UpdateMeasurementRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateMeasurementRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateMeasurementRequestToJson(this);
}
