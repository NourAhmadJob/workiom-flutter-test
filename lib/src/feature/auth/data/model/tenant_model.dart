import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/tenant.dart';

part 'tenant_model.g.dart';

@JsonSerializable()
class TenantModel extends Tenant {
  TenantModel({
    required super.tenancyName,
    required super.name,
    required super.ownerId,
  });

  factory TenantModel.fromJson(Map<String, dynamic> json) =>
      _$TenantModelFromJson(json);

  Map<String, dynamic> toJson() => _$TenantModelToJson(this);
}

