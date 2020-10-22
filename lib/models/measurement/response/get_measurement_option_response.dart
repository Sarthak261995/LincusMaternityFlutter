import 'package:json_annotation/json_annotation.dart';

import '../measurement_option_model.dart';
part 'get_measurement_option_response.g.dart';

@JsonSerializable()
class GetMeasurementOptionResponse {
  int status;
  String message;
  List<MeasurementOptionModel> data;

  GetMeasurementOptionResponse({this.status, this.message, this.data});
  factory GetMeasurementOptionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMeasurementOptionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetMeasurementOptionResponseToJson(this);
}
