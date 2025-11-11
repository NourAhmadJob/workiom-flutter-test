import 'package:json_annotation/json_annotation.dart';

part 'register_body.g.dart';

@JsonSerializable()
class RegisterBody {
  final String adminEmailAddress;
  final String adminFirstName;
  final String adminLastName;
  final String adminPassword;
  final bool? captchaResponse;
  final int editionId;
  final String name;
  final String tenancyName;

  RegisterBody({
    required this.adminEmailAddress,
    required this.adminFirstName,
    required this.adminLastName,
    required this.adminPassword,
    required this.captchaResponse,
    required this.editionId,
    required this.name,
    required this.tenancyName,
  });


  Map<String,dynamic> toJson () => _$RegisterBodyToJson(this);
}
