import 'package:json_annotation/json_annotation.dart';
import 'package:lincus_maternity/models/pregnancy/week_development.dart';
part 'pregnancy_additional_info.g.dart';

@JsonSerializable()
class PregnancyAdditionalInfo {
  @JsonKey(name: 'days_in')
  int daysIn;
  @JsonKey(name: 'days_left')
  int daysLeft;
  @JsonKey(name: 'weeks_in')
  int weeksIn;
  @JsonKey(name: 'week_development')
  WeekDevelopment weekDevelopment;
  int trimester;

  PregnancyAdditionalInfo(
      {this.daysIn,
      this.daysLeft,
      this.weeksIn,
      this.weekDevelopment,
      this.trimester});
  factory PregnancyAdditionalInfo.fromJson(Map<String, dynamic> json) =>
      _$PregnancyAdditionalInfoFromJson(json);
  Map<String, dynamic> toJson() => _$PregnancyAdditionalInfoToJson(this);
}
