import 'package:json_annotation/json_annotation.dart';

import '../basic_info.dart';
part 'basic_info_response.g.dart';

@JsonSerializable()
class BasicInfoResponse {
  int status;
  String message;
  UserBasicInfo data;

  BasicInfoResponse({this.status, this.message, this.data});
  factory BasicInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BasicInfoResponseToJson(this);
}
