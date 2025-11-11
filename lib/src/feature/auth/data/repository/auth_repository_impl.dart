import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:untitled/src/feature/auth/data/datasource/auth_datasource.dart';
import 'package:untitled/src/feature/auth/domain/entities/current_login_information.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/error_handler.dart';
import '../../../../core/utils/message.dart';
import '../../domain/entities/auth_body_request/login_body.dart';
import '../../domain/entities/auth_body_request/register_body.dart';
import '../../domain/entities/get_editions.dart';
import '../../domain/entities/get_password_validation.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, GetPasswordValidation>> getPasswordValidation() async {
    try {
     final response =  await dataSource.getPasswordValidation();
      return Right(response.result!);
    } on DioException catch (e) {
      return Left(ErrorHandler.handleDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (_) {
      return Left(ServerFailure(message: ErrorMessages.unKnownError));
    }
  }

  @override
  Future<Either<Failure, GetEditions>> getEditions() async {
    try {
      final response = await dataSource.getEditions();
      return Right(response.result!);
    } on DioException catch (e) {
      return Left(ErrorHandler.handleDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (_) {
      return Left(ServerFailure(message: ErrorMessages.unKnownError));
    }
  }

  @override
  Future<Either<Failure, void>> isTenantAvailable(String tenancyName) async {
    try {
      final body = {
        'tenancyName' : tenancyName
      };
      await dataSource.isTenantAvailable(body);
      return const Right(null);
    } on DioException catch (e) {
      return Left(ErrorHandler.handleDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (_) {
      return Left(ServerFailure(message: ErrorMessages.unKnownError));
    }
  }

  @override
  Future<Either<Failure, void>> register(RegisterBody body) async {
    try {
      await dataSource.register(body.toJson());
      return const Right(null);
    } on DioException catch (e) {
      print('======== here in dio exception ${e.response}');
      return Left(ErrorHandler.handleDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (_) {
      return Left(ServerFailure(message: ErrorMessages.unKnownError));
    }
  }

  @override
  Future<Either<Failure, User>> login(LoginBody body) async {
    try {
      final response = await dataSource.login(body.toJson());
      return Right(response.result!);
    } on DioException catch (e) {
      return Left(ErrorHandler.handleDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (_) {
      return Left(ServerFailure(message: ErrorMessages.unKnownError));
    }
  }

  @override
  Future<Either<Failure, CurrentLoginInformation>> getCurrentLoginInformation()async{
    try {
      final response = await dataSource.getCurrentLoginInformation();
      return Right(response.result!);
    } on DioException catch (e) {
      return Left(ErrorHandler.handleDioError(e));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (_) {
      return Left(ServerFailure(message: ErrorMessages.unKnownError));
    }
  }
}

