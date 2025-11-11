part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class PasswordValidationLoadingState extends AuthState {}

final class PasswordValidationSuccessState extends AuthState {
  final SettingProfile settingProfile;

  PasswordValidationSuccessState({required this.settingProfile});
}

final class PasswordValidationErrorState extends AuthState {
  final String message;

  PasswordValidationErrorState({required this.message});
}

final class EditionsLoadingState extends AuthState {}

final class EditionsSuccessState extends AuthState {
  final List<EditionWithFeatures> registrableEditions;

  EditionsSuccessState({required this.registrableEditions});
}

final class EditionsErrorState extends AuthState {
  final String message;

  EditionsErrorState({required this.message});
}

final class CheckTenantAvailabilityLoadingState extends AuthState {}

final class CheckTenantAvailableSuccessState extends AuthState {
  final String tenancyName;

  CheckTenantAvailableSuccessState({required this.tenancyName});
}

final class CheckTenantAvailableErrorState extends AuthState {
  final String message;

  CheckTenantAvailableErrorState({required this.message});
}

final class RegisterTenantLoadingState extends AuthState {}

final class RegisterTenantSuccessState extends AuthState {}

final class RegisterTenantErrorState extends AuthState {
  final String message;

  RegisterTenantErrorState({required this.message});
}


final class LoginTenantLoadingState extends AuthState {}

final class LoginTenantSuccessState extends AuthState {}

final class LoginTenantErrorState extends AuthState {
  final String message;

  LoginTenantErrorState({required this.message});
}


final class GetCurrentLoginInformationLoadingState extends AuthState {}

final class GetCurrentLoginInformationSuccessState extends AuthState {
  final CurrentLoginInformation currentLoginInformation;

  GetCurrentLoginInformationSuccessState({required this.currentLoginInformation});
}

final class GetCurrentLoginInformationErrorState extends AuthState {
  final String message;

  GetCurrentLoginInformationErrorState({required this.message});
}

