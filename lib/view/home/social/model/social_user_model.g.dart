// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialUserModel _$SocialUserModelFromJson(Map<String, dynamic> json) {
  return SocialUserModel(
    sId: json['_id'] as String?,
    name: json['name'] as String?,
    company: json['company'] as String?,
    image: json['image'] as String?,
    iV: json['iV'] as int?,
  );
}

Map<String, dynamic> _$SocialUserModelToJson(SocialUserModel instance) =>
    <String, dynamic>{
      '_id': instance.sId,
      'name': instance.name,
      'company': instance.company,
      'image': instance.image,
      'iV': instance.iV,
    };
