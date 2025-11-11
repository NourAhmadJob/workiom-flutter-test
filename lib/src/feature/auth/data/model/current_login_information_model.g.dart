// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_login_information_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentLoginInformationModel _$CurrentLoginInformationModelFromJson(
  Map<String, dynamic> json,
) => CurrentLoginInformationModel(
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
  tenant: json['tenant'] == null
      ? null
      : Tenant.fromJson(json['tenant'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CurrentLoginInformationModelToJson(
  CurrentLoginInformationModel instance,
) => <String, dynamic>{'user': instance.user, 'tenant': instance.tenant};
