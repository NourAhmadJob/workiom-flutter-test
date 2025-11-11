import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/setting_profile.dart';

part 'setting_profile_model.g.dart';

@JsonSerializable()
class SettingProfileModel extends SettingProfile {
  SettingProfileModel({
    required super.requireDigit,
    required super.requireLowercase,
    required super.requireNonAlphanumeric,
    required super.requireUppercase,
    required super.requiredLength,
  });

  factory SettingProfileModel.fromJson(Map<String, dynamic> json) =>
      _$SettingProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingProfileModelToJson(this);
}

