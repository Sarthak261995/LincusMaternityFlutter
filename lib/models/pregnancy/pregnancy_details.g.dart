// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pregnancy_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PregnancyDetails _$PregnancyDetailsFromJson(Map<String, dynamic> json) {
  return PregnancyDetails(
    id: json['id'] as int,
    userID: json['userID'] as int,
    editID: json['editID'] as int,
    status: json['status'] as int,
    expected: json['expected'] as String,
    birthplanId: json['birthplan_id'],
    dob: json['dob'],
    forename: json['forename'],
    surname: json['surname'],
    gender: json['gender'] as String,
    timestamp: json['timestamp'] as String,
    lastUpdated: json['last_updated'] as String,
    trackingOff: json['tracking_off'],
    additionalInfo: json['additional_info'] == null
        ? null
        : PregnancyAdditionalInfo.fromJson(
            json['additional_info'] as Map<String, dynamic>),
    userDeleted: json['user_deleted'],
  );
}

Map<String, dynamic> _$PregnancyDetailsToJson(PregnancyDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'editID': instance.editID,
      'status': instance.status,
      'expected': instance.expected,
      'birthplan_id': instance.birthplanId,
      'dob': instance.dob,
      'forename': instance.forename,
      'surname': instance.surname,
      'gender': instance.gender,
      'timestamp': instance.timestamp,
      'last_updated': instance.lastUpdated,
      'tracking_off': instance.trackingOff,
      'additional_info': instance.additionalInfo,
      'user_deleted': instance.userDeleted,
    };
