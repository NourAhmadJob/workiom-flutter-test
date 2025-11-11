import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/src/feature/auth/domain/entities/tenant.dart';
import 'package:untitled/src/feature/auth/domain/entities/user.dart';

part 'current_login_information.g.dart';

@JsonSerializable()
class CurrentLoginInformation {
  final User? user;
  final Tenant? tenant;

  CurrentLoginInformation({required this.user, required this.tenant});

  factory CurrentLoginInformation.fromJson(Map<String,dynamic>json) => _$CurrentLoginInformationFromJson(json);
}