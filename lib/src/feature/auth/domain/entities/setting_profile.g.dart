// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingProfile _$SettingProfileFromJson(Map<String, dynamic> json) =>
    SettingProfile(
      requireDigit: json['requireDigit'] as bool,
      requireLowercase: json['requireLowercase'] as bool,
      requireNonAlphanumeric: json['requireNonAlphanumeric'] as bool,
      requireUppercase: json['requireUppercase'] as bool,
      requiredLength: (json['requiredLength'] as num).toInt(),
    );

Map<String, dynamic> _$SettingProfileToJson(SettingProfile instance) =>
    <String, dynamic>{
      'requireDigit': instance.requireDigit,
      'requireLowercase': instance.requireLowercase,
      'requireNonAlphanumeric': instance.requireNonAlphanumeric,
      'requireUppercase': instance.requireUppercase,
      'requiredLength': instance.requiredLength,
    };
