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
  String pictureFile;
  String dob;
  String gender;
  String email;
  String postcode;
  String employment;
  String education;
  String height;
  String waist;
  @JsonKey(name: 'language_preference')
  String languagePreference;
  @JsonKey(name: 'default_language')
  String defaultLanguage;
  @JsonKey(name: 'profile_picture')
  String profilePicture;
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
      this.pictureFile,
      this.dob,
      this.gender,
      this.email,
      this.postcode,
      this.employment,
      this.education,
      this.height,
      this.waist,
      this.languagePreference,
      this.defaultLanguage,
      this.profilePicture,
      this.verifiedTimestamp,
      this.created,
      this.carer,
      this.interests});
  factory UserBasicInfo.fromJson(Map<String, dynamic> json) =>
      _$UserBasicInfoFromJson(json);
  Map<String, dynamic> toJson() => _$UserBasicInfoToJson(this);
}
