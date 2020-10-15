// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'week_development.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeekDevelopment _$WeekDevelopmentFromJson(Map<String, dynamic> json) {
  return WeekDevelopment(
    id: json['id'] as int,
    type: json['type'] as String,
    weekNumber: json['week_number'] as int,
    weight: json['weight'] as int,
    length: (json['length'] as num)?.toDouble(),
    sizeText: json['size_text'] as String,
    sizeImage: json['size_image'] as String,
    lengthFormatted: json['length_formatted'] as String,
    weightFormatted: json['weight_formatted'] as String,
  );
}

Map<String, dynamic> _$WeekDevelopmentToJson(WeekDevelopment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'week_number': instance.weekNumber,
      'weight': instance.weight,
      'length': instance.length,
      'size_text': instance.sizeText,
      'size_image': instance.sizeImage,
      'length_formatted': instance.lengthFormatted,
      'weight_formatted': instance.weightFormatted,
    };
