import 'package:json_annotation/json_annotation.dart';

part 'setting_profile.g.dart';

@JsonSerializable()
class SettingProfile {
  final bool requireDigit;
  final bool requireLowercase;
  final bool requireNonAlphanumeric;
  final bool requireUppercase;
  final int requiredLength;

  SettingProfile({
    required this.requireDigit,
    required this.requireLowercase,
    required this.requireNonAlphanumeric,
    required this.requireUppercase,
    required this.requiredLength,
  });

  factory SettingProfile.fromJson(Map<String,dynamic>json) => _$SettingProfileFromJson(json);
}
