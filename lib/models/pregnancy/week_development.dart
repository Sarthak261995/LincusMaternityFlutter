import 'package:json_annotation/json_annotation.dart';
part 'week_development.g.dart';

@JsonSerializable()
class WeekDevelopment {
  int id;
  String type;
  @JsonKey(name: 'week_number')
  int weekNumber;
  int weight;
  double length;
  @JsonKey(name: 'size_text')
  String sizeText;
  @JsonKey(name: 'size_image')
  String sizeImage;
  @JsonKey(name: 'length_formatted')
  String lengthFormatted;
  @JsonKey(name: 'weight_formatted')
  String weightFormatted;

  WeekDevelopment(
      {this.id,
      this.type,
      this.weekNumber,
      this.weight,
      this.length,
      this.sizeText,
      this.sizeImage,
      this.lengthFormatted,
      this.weightFormatted});
  factory WeekDevelopment.fromJson(Map<String, dynamic> json) =>
      _$WeekDevelopmentFromJson(json);
  Map<String, dynamic> toJson() => _$WeekDevelopmentToJson(this);
}
