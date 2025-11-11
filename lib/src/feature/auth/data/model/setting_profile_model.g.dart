// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingProfileModel _$SettingProfileModelFromJson(Map<String, dynamic> json) =>
    SettingProfileModel(
      requireDigit: json['requireDigit'] as bool,
      requireLowercase: json['requireLowercase'] as bool,
      requireNonAlphanumeric: json['requireNonAlphanumeric'] as bool,
      requireUppercase: json['requireUppercase'] as bool,
      requiredLength: (json['requiredLength'] as num).toInt(),
    );

Map<String, dynamic> _$SettingProfileModelToJson(
  SettingProfileModel instance,
) => <String, dynamic>{
  'requireDigit': instance.requireDigit,
  'requireLowercase': instance.requireLowercase,
  'requireNonAlphanumeric': instance.requireNonAlphanumeric,
  'requireUppercase': instance.requireUppercase,
  'requiredLength': instance.requiredLength,
};
