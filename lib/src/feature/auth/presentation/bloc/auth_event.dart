part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class GetPasswordValidationEvent extends AuthEvent {}

final class GetEditionsEvent extends AuthEvent {}

final class CheckTenantAvailabilityEvent extends AuthEvent {
  final String tenancyName;

  CheckTenantAvailabilityEvent({required this.tenancyName});
}

final class RegisterTenantEvent extends AuthEvent {
  final RegisterBody body;

  RegisterTenantEvent({required this.body});
}

final class LoginTenantEvent extends AuthEvent {
  final LoginBody body;

  LoginTenantEvent({required this.body});
}

final class GetCurrentLoginInformationEvent extends AuthEvent {}