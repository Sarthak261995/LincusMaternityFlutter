import 'package:json_annotation/json_annotation.dart';
import 'package:lincus_maternity/models/pregnancy/pregnancy_additional_info.dart';
part 'pregnancy_details.g.dart';

@JsonSerializable()
class PregnancyDetails {
  int id;
  int userID;
  int editID;
  int status;
  String expected;
  @JsonKey(name: 'birthplan_id')
  Object birthplanId;
  Object dob;
  Object forename;
  Object surname;
  String gender;
  String timestamp;
  @JsonKey(name: 'last_updated')
  String lastUpdated;
  @JsonKey(name: 'tracking_off')
  Object trackingOff;
  @JsonKey(name: 'additional_info')
  PregnancyAdditionalInfo additionalInfo;
  @JsonKey(name: 'user_deleted')
  Object userDeleted;

  PregnancyDetails(
      {this.id,
      this.userID,
      this.editID,
      this.status,
      this.expected,
      this.birthplanId,
      this.dob,
      this.forename,
      this.surname,
      this.gender,
      this.timestamp,
      this.lastUpdated,
      this.trackingOff,
      this.additionalInfo,
      this.userDeleted});
  factory PregnancyDetails.fromJson(Map<String, dynamic> json) =>
      _$PregnancyDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PregnancyDetailsToJson(this);
}
