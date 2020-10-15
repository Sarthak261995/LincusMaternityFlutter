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
    pictureFile: json['pictureFile'] as String,
    dob: json['dob'] as String,
    gender: json['gender'] as String,
    email: json['email'] as String,
    postcode: json['postcode'] as String,
    employment: json['employment'] as String,
    education: json['education'] as String,
    height: json['height'] as String,
    waist: json['waist'] as String,
    languagePreference: json['language_preference'] as String,
    defaultLanguage: json['default_language'] as String,
    profilePicture: json['profile_picture'] as String,
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
      'pictureFile': instance.pictureFile,
      'dob': instance.dob,
      'gender': instance.gender,
      'email': instance.email,
      'postcode': instance.postcode,
      'employment': instance.employment,
      'education': instance.education,
      'height': instance.height,
      'waist': instance.waist,
      'language_preference': instance.languagePreference,
      'default_language': instance.defaultLanguage,
      'profile_picture': instance.profilePicture,
      'verified_timestamp': instance.verifiedTimestamp,
      'created': instance.created,
      'carer': instance.carer,
      'interests': instance.interests,
    };
