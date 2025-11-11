// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_login_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentLoginInformation _$CurrentLoginInformationFromJson(
  Map<String, dynamic> json,
) => CurrentLoginInformation(
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  tenant: json['tenant'] == null
      ? null
      : Tenant.fromJson(json['tenant'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CurrentLoginInformationToJson(
  CurrentLoginInformation instance,
) => <String, dynamic>{'user': instance.user, 'tenant': instance.tenant};
