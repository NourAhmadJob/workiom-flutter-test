import 'package:json_annotation/json_annotation.dart';

part 'login_body.g.dart';

@JsonSerializable()
class LoginBody {
  final String ianaTimeZone;
  final String password;
  @JsonKey(defaultValue: false)
  final bool rememberClient;
  @JsonKey(defaultValue: null , includeIfNull: true)
  final String? returnUrl;
  @JsonKey(defaultValue: false)
  final bool singleSignIn;
  final String tenantName;
  final String userNameOrEmailAddress;

  LoginBody({required this.ianaTimeZone, required this.password, required this.rememberClient, required this.returnUrl, required this.singleSignIn, required this.tenantName, required this.userNameOrEmailAddress});

  Map<String,dynamic> toJson() => _$LoginBodyToJson(this);
}