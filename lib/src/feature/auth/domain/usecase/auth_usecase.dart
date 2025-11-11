import 'package:dartz/dartz.dart';
import 'package:untitled/src/feature/auth/domain/entities/user.dart';
import 'package:untitled/src/feature/auth/domain/repository/auth_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/auth_body_request/login_body.dart';
import '../entities/auth_body_request/register_body.dart';
import '../entities/current_login_information.dart';
import '../entities/get_editions.dart';
import '../entities/get_password_validation.dart';

class AuthUseCase {
  final AuthRepository repository;

  AuthUseCase({required this.repository});

  Future<Either<Failure, GetEditions>> getEditions() async {
    return await repository.getEditions();
  }

  Future<Either<Failure, GetPasswordValidation>> getPasswordValidation() async {
    return await repository.getPasswordValidation();
  }

  Future<Either<Failure, void>> isTenantAvailable(String tenancyName) async {
    return await repository.isTenantAvailable(tenancyName);
  }

  Future<Either<Failure, void>> register(RegisterBody body) async {
    return await repository.register(body);
  }

  Future<Either<Failure, User>> login(LoginBody body) async {
    return await repository.login(body);
  }

  Future<Either<Failure,CurrentLoginInformation>> getCurrentLoginInformation() async {
    return await repository.getCurrentLoginInformation();
  }
}
