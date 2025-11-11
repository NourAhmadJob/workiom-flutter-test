import 'package:json_annotation/json_annotation.dart';

part 'tenant.g.dart';

@JsonSerializable()
class Tenant {
  final String tenancyName;
  final String name;
  final int ownerId;

  Tenant({required this.tenancyName, required this.name, required this.ownerId});


  factory Tenant.fromJson(Map<String,dynamic>json) => _$TenantFromJson(json);
}