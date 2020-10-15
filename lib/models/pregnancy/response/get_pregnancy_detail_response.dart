import 'package:json_annotation/json_annotation.dart';
import 'package:lincus_maternity/models/pregnancy/pregnancy_details.dart';
part 'get_pregnancy_detail_response.g.dart';

@JsonSerializable()
class GetPregnancyDetailResponse {
  int status;
  String message;
  PregnancyDetails data;

  GetPregnancyDetailResponse({this.status, this.message, this.data});
  factory GetPregnancyDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPregnancyDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GetPregnancyDetailResponseToJson(this);
}
