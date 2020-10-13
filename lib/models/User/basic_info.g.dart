// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserBasicInfo _$UserBasicInfoFromJson(Map<String, dynamic> json) {
  return UserBasicInfo(
    id: json['id'] as String,
    username: json['username'] as String,
    type: json['type'] as String,
    forename: json['forename'] as String,
    surname: json['surname'] as String,
    centreCode: json['centre_code'] as String,
    gender: json['gender'] as String,
    email: json['email'] as String,
    verifiedTimestamp: json['verified_timestamp'] as String,
    created: json['created'] as String,
    carer: (json['carer'] as List)?.map((e) => e as String)?.toList(),
    interests: (json['interests'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserBasicInfoToJson(UserBasicInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'type': instance.type,
      'forename': instance.forename,
      'surname': instance.surname,
      'centre_code': instance.centreCode,
      'gender': instance.gender,
      'email': instance.email,
      'verified_timestamp': instance.verifiedTimestamp,
      'created': instance.created,
      'carer': instance.carer,
      'interests': instance.interests,
    };
