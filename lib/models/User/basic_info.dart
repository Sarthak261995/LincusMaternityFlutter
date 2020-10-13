import 'package:json_annotation/json_annotation.dart';
part 'basic_info.g.dart';

@JsonSerializable()
class UserBasicInfo {
  String id;
  String username;
  String type;
  String forename;
  String surname;
  @JsonKey(name: 'centre_code')
  String centreCode;
  String gender;
  String email;
  @JsonKey(name: 'verified_timestamp')
  String verifiedTimestamp;
  String created;
  List<String> carer;
  List<String> interests;

  UserBasicInfo(
      {this.id,
      this.username,
      this.type,
      this.forename,
      this.surname,
      this.centreCode,
      this.gender,
      this.email,
      this.verifiedTimestamp,
      this.created,
      this.carer,
      this.interests});
  factory UserBasicInfo.fromJson(Map<String, dynamic> json) =>
      _$UserBasicInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserBasicInfoToJson(this);
}
