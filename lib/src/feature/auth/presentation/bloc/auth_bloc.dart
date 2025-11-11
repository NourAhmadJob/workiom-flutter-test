import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:untitled/src/core/network/dio_helper.dart';
import 'package:untitled/src/core/utils/secure_storage.dart';
import 'package:untitled/src/feature/auth/domain/entities/auth_body_request/login_body.dart';
import 'package:untitled/src/feature/auth/domain/entities/auth_body_request/register_body.dart';
import 'package:untitled/src/feature/auth/domain/entities/current_login_information.dart';
import 'package:untitled/src/feature/auth/domain/usecase/auth_usecase.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/app_regex.dart';
import '../../../../core/utils/message.dart';
import '../../domain/entities/edition_with_features.dart';
import '../../domain/entities/setting_profile.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.useCase}) : super(AuthInitial()) {
    on<GetPasswordValidationEvent>(_getPasswordValidationFunction);
    on<GetEditionsEvent>(_getEditionsFunction);
    on<CheckTenantAvailabilityEvent>(_checkTenantAvailabilityFunction);
    on<RegisterTenantEvent>(_registerTenantFunction);
    on<LoginTenantEvent>(_loginTenantFunction);
    on<GetCurrentLoginInformationEvent>(_getCurrentLoginInformationFunction);
  }

  final AuthUseCase useCase;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController tenantNameController = TextEditingController();
  String timeZone = '';


  SettingProfile? _settingProfile;
  EditionWithFeatures? _editionWithFeatureWithValidId;
  List<EditionWithFeatures>? _registrableEditionsWithFeature;

  SettingProfile? get settingProfile => _settingProfile;

  EditionWithFeatures? get getEditionWithFeatureWithValidId =>
      _editionWithFeatureWithValidId;

  List<EditionWithFeatures>? get registrableEditions =>
      _registrableEditionsWithFeature;

  Future<void> _getPasswordValidationFunction(
    GetPasswordValidationEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(PasswordValidationLoadingState());

    final result = await useCase.getPasswordValidation();

    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(
            PasswordValidationErrorState(message: failure.message.toString()),
          );
        } else if (failure is NetworkFailure) {
          emit(
            PasswordValidationErrorState(message: failure.message.toString()),
          );
        } else if (failure is AuthFailure) {
          emit(
            PasswordValidationErrorState(message: failure.message.toString()),
          );
        } else {
          emit(
            PasswordValidationErrorState(
              message: ErrorMessages.unexpectedError,
            ),
          );
        }
      },
      (passwordValidation) {
        _settingProfile = passwordValidation.setting;
        emit(
          PasswordValidationSuccessState(
            settingProfile: passwordValidation.setting,
          ),
        );
      },
    );
  }

  double calculatePasswordStrength(String password) {
    if (_settingProfile == null || password.isEmpty) return 0.0;

    int validCount = 0;
    int totalRules = 0;

    totalRules++;
    if (password.length >= _settingProfile!.requiredLength) {
      validCount++;
    }

    if (_settingProfile!.requireUppercase) {
      totalRules++;
      if (password.contains(RegExp(r'[A-Z]'))) validCount++;
    }

    if (_settingProfile!.requireLowercase) {
      totalRules++;
      if (password.contains(RegExp(r'[a-z]'))) validCount++;
    }

    if (_settingProfile!.requireDigit) {
      totalRules++;
      if (password.contains(RegExp(r'[0-9]'))) validCount++;
    }

    if (_settingProfile!.requireNonAlphanumeric) {
      totalRules++;
      if (password.contains(RegExp(r'[^a-zA-Z0-9]'))) validCount++;
    }

    return totalRules > 0 ? validCount / totalRules : 0.0;
  }
  bool isEmailValid(String email) {
    if(email.isEmpty || !AppRegex.isEmailValid(email)) {
     return false;
    }
    return true;
  }

  bool isPasswordValid(String password) {
    if (_settingProfile == null || password.isEmpty) return false;

    bool isValid = password.length >= _settingProfile!.requiredLength;

    if (_settingProfile!.requireUppercase) {
      isValid = isValid && password.contains(RegExp(r'[A-Z]'));
    }

    if (_settingProfile!.requireLowercase) {
      isValid = isValid && password.contains(RegExp(r'[a-z]'));
    }

    if (_settingProfile!.requireDigit) {
      isValid = isValid && password.contains(RegExp(r'[0-9]'));
    }

    if (_settingProfile!.requireNonAlphanumeric) {
      isValid = isValid && password.contains(RegExp(r'[^a-zA-Z0-9]'));
    }

    return isValid;
  }

  Future<void> _getEditionsFunction(
    GetEditionsEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(EditionsLoadingState());

    final result = await useCase.getEditions();

    result.fold(
      (failure) {
        if (failure is ServerFailure) {
          emit(EditionsErrorState(message: failure.message.toString()));
        } else if (failure is NetworkFailure) {
          emit(EditionsErrorState(message: failure.message.toString()));
        } else if (failure is AuthFailure) {
          emit(EditionsErrorState(message: failure.message.toString()));
        } else {
          emit(EditionsErrorState(message: ErrorMessages.unexpectedError));
        }
      },
      (editionsData) {
        final registrable = editionsData.editionsWithFeatures
            .where(
              (editionWithFeatures) =>
                  editionWithFeatures.edition.isRegistrable,
            )
            .toList();

        _registrableEditionsWithFeature = registrable;

        if (registrable.isNotEmpty) {
          _editionWithFeatureWithValidId = registrable.first;
        }

        emit(EditionsSuccessState(registrableEditions: registrable));
      },
    );
  }

  Future<void> _checkTenantAvailabilityFunction(
    CheckTenantAvailabilityEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(CheckTenantAvailabilityLoadingState());

    final result = await useCase.isTenantAvailable(event.tenancyName);

    result.fold(
      (failure) {
        if (failure is AuthFailure) {
          emit(
            CheckTenantAvailableErrorState(message: failure.message.toString()),
          );
        } else if (failure is ServerFailure) {
          emit(
            CheckTenantAvailableErrorState(message: failure.message.toString()),
          );
        } else if (failure is NetworkFailure) {
          emit(
            CheckTenantAvailableErrorState(message: failure.message.toString()),
          );
        } else {
          emit(
            CheckTenantAvailableErrorState(
              message: ErrorMessages.unexpectedError,
            ),
          );
        }
      },
      (_) {
        emit(CheckTenantAvailableSuccessState(tenancyName: event.tenancyName));
      },
    );
  }

  FutureOr<void> _registerTenantFunction(
    RegisterTenantEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(RegisterTenantLoadingState());

    final response = await useCase.register(event.body);
    final currentTimeZone = await FlutterTimezone.getLocalTimezone();

    print('=================== ${currentTimeZone.identifier}');
    print('=================== ${currentTimeZone.localizedName}');

    response.fold(
      (failure) {
        if (failure is AuthFailure) {
          emit(RegisterTenantErrorState(message: failure.message.toString()));
        } else if (failure is ServerFailure) {
          emit(RegisterTenantErrorState(message: failure.message.toString()));
        } else if (failure is NetworkFailure) {
          emit(RegisterTenantErrorState(message: failure.message.toString()));
        } else {
          emit(
            RegisterTenantErrorState(message: ErrorMessages.unexpectedError),
          );
        }
      },
      (_) {
        timeZone = currentTimeZone.identifier;
        emit(RegisterTenantSuccessState());
      },
    );
  }

  RegisterBody get body => RegisterBody(
    adminEmailAddress: emailController.text,
    adminFirstName: firstNameController.text,
    adminLastName: lastNameController.text,
    adminPassword: passwordController.text,
    captchaResponse: null,
    editionId: _editionWithFeatureWithValidId!.edition.id,
    name: tenantNameController.text,
    tenancyName: tenantNameController.text,
  );

  FutureOr<void> _loginTenantFunction(
    LoginTenantEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginTenantLoadingState());
    final response = await useCase.login(event.body);
    await response.fold(
      (failure) {
        if (failure is AuthFailure) {
          emit(LoginTenantErrorState(message: failure.message.toString()));
        } else if (failure is ServerFailure) {
          emit(LoginTenantErrorState(message: failure.message.toString()));
        } else if (failure is NetworkFailure) {
          emit(LoginTenantErrorState(message: failure.message.toString()));
        } else {
          emit(LoginTenantErrorState(message: ErrorMessages.unexpectedError));
        }
      },
      (user) async {
        final token = user.accessToken.toString();
        print('============ token $token ========');
        await SecureStorage.saveToken(access: token);

        await DioHelper.setToken(token);
        
        emit(LoginTenantSuccessState());
      },
    );
  }

  LoginBody get loginBody => LoginBody(
    ianaTimeZone: timeZone,
    password: passwordController.text,
    rememberClient: false,
    returnUrl: null,
    singleSignIn: false,
    tenantName: tenantNameController.text,
    userNameOrEmailAddress: emailController.text,
  );

  FutureOr<void> _getCurrentLoginInformationFunction(
    GetCurrentLoginInformationEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(GetCurrentLoginInformationLoadingState());

    final result = await useCase.getCurrentLoginInformation();

    result.fold(
      (failure) {
        if (failure is AuthFailure) {
          emit(
            GetCurrentLoginInformationErrorState(
              message: failure.message.toString(),
            ),
          );
        } else if (failure is ServerFailure) {
          emit(
            GetCurrentLoginInformationErrorState(
              message: failure.message.toString(),
            ),
          );
        } else if (failure is NetworkFailure) {
          emit(
            GetCurrentLoginInformationErrorState(
              message: failure.message.toString(),
            ),
          );
        } else {
          emit(
            GetCurrentLoginInformationErrorState(
              message: ErrorMessages.unexpectedError,
            ),
          );
        }
      },
      (currentLoginInformation) => emit(GetCurrentLoginInformationSuccessState(
        currentLoginInformation: currentLoginInformation,
      )),
    );
  }
}
