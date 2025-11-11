// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  accessToken: json['accessToken'] as String?,
  encryptedAccessToken: json['encryptedAccessToken'] as String?,
  userId: (json['userId'] as num?)?.toInt(),
  name: json['name'] as String?,
  username: json['username'] as String?,
  emailAddress: json['emailAddress'] as String?,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'encryptedAccessToken': instance.encryptedAccessToken,
  'userId': instance.userId,
  'name': instance.name,
  'username': instance.username,
  'emailAddress': instance.emailAddress,
};
