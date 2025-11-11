import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/setting_profile.dart';

part 'get_password_validation.g.dart';

@JsonSerializable()
class GetPasswordValidation {
  final SettingProfile setting;

  GetPasswordValidation({required this.setting});

  factory GetPasswordValidation.fromJson(Map<String,dynamic>json) => _$GetPasswordValidationFromJson(json);
}