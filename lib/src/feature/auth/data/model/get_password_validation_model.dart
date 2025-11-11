import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/get_password_validation.dart';
import 'package:untitled/src/feature/auth/domain/entities/setting_profile.dart';

part 'get_password_validation_model.g.dart';

@JsonSerializable()
class GetPasswordValidationModel extends GetPasswordValidation {
  GetPasswordValidationModel({
    required super.setting,
  });

  factory GetPasswordValidationModel.fromJson(Map<String, dynamic> json) =>
      _$GetPasswordValidationModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetPasswordValidationModelToJson(this);
}

