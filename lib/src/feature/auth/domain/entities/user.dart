import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? accessToken;
  final String? encryptedAccessToken;
  final int? userId;
  final String? name;
  final String? username;
  final String? emailAddress;

  User({
    this.accessToken,
    this.encryptedAccessToken,
    this.userId,
    this.name,
    this.username,
    this.emailAddress,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
