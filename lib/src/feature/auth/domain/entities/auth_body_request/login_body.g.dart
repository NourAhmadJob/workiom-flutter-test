// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginBody _$LoginBodyFromJson(Map<String, dynamic> json) => LoginBody(
  ianaTimeZone: json['ianaTimeZone'] as String,
  password: json['password'] as String,
  rememberClient: json['rememberClient'] as bool? ?? false,
  returnUrl: json['returnUrl'] as String?,
  singleSignIn: json['singleSignIn'] as bool? ?? false,
  tenantName: json['tenantName'] as String,
  userNameOrEmailAddress: json['userNameOrEmailAddress'] as String,
);

Map<String, dynamic> _$LoginBodyToJson(LoginBody instance) => <String, dynamic>{
  'ianaTimeZone': instance.ianaTimeZone,
  'password': instance.password,
  'rememberClient': instance.rememberClient,
  'returnUrl': instance.returnUrl,
  'singleSignIn': instance.singleSignIn,
  'tenantName': instance.tenantName,
  'userNameOrEmailAddress': instance.userNameOrEmailAddress,
};
