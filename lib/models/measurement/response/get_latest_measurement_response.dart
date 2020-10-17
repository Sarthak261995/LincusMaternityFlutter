import 'package:json_annotation/json_annotation.dart';

import '../measurement_model.dart';
part 'get_latest_measurement_response.g.dart';

@JsonSerializable()
class GetLatestMeasurementResponse {
  int status;
  String message;
  List<MeasurementModel> data;

  GetLatestMeasurementResponse({this.status, this.message, this.data});
  factory GetLatestMeasurementResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLatestMeasurementResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetLatestMeasurementResponseToJson(this);
}
