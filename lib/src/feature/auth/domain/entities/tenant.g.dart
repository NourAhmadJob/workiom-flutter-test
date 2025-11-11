// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tenant _$TenantFromJson(Map<String, dynamic> json) => Tenant(
  tenancyName: json['tenancyName'] as String,
  name: json['name'] as String,
  ownerId: (json['ownerId'] as num).toInt(),
);

Map<String, dynamic> _$TenantToJson(Tenant instance) => <String, dynamic>{
  'tenancyName': instance.tenancyName,
  'name': instance.name,
  'ownerId': instance.ownerId,
};
