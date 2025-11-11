import 'package:dartz/dartz.dart';
import 'package:untitled/src/feature/auth/domain/entities/auth_body_request/login_body.dart';
import 'package:untitled/src/feature/auth/domain/entities/auth_body_request/register_body.dart';
import 'package:untitled/src/feature/auth/domain/entities/current_login_information.dart';
import 'package:untitled/src/feature/auth/domain/entities/get_editions.dart';
import 'package:untitled/src/feature/auth/domain/entities/get_password_validation.dart';
import 'package:untitled/src/feature/auth/domain/entities/user.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure , GetEditions>> getEditions();
  Future<Either<Failure,GetPasswordValidation>> getPasswordValidation();
  Future<Either<Failure,void>> isTenantAvailable(String tenancyName);
  Future<Either<Failure,void>> register(RegisterBody body);
  Future<Either<Failure,User>> login(LoginBody body);
  Future<Either<Failure,CurrentLoginInformation>> getCurrentLoginInformation();
}