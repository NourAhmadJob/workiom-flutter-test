// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TenantModel _$TenantModelFromJson(Map<String, dynamic> json) => TenantModel(
  tenancyName: json['tenancyName'] as String,
  name: json['name'] as String,
  ownerId: (json['ownerId'] as num).toInt(),
);

Map<String, dynamic> _$TenantModelToJson(TenantModel instance) =>
    <String, dynamic>{
      'tenancyName': instance.tenancyName,
      'name': instance.name,
      'ownerId': instance.ownerId,
    };
