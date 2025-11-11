import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/current_login_information.dart';
import 'package:untitled/src/feature/auth/domain/entities/user.dart';
import 'package:untitled/src/feature/auth/domain/entities/tenant.dart';

part 'current_login_information_model.g.dart';

@JsonSerializable()
class CurrentLoginInformationModel extends CurrentLoginInformation {
  CurrentLoginInformationModel({
    required super.user,
    required super.tenant,
  });

  factory CurrentLoginInformationModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentLoginInformationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentLoginInformationModelToJson(this);
}

