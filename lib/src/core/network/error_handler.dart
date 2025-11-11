import 'package:dio/dio.dart';
import '../errors/failures.dart';
import '../utils/message.dart';

class ErrorHandler {
  static Failure handleDioError(DioException error,{String? message}) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkFailure(message: ErrorMessages.connectionTimeout);
      case DioExceptionType.sendTimeout:
        return NetworkFailure(message: ErrorMessages.sendTimeout);
      case DioExceptionType.receiveTimeout:
        return NetworkFailure(message: ErrorMessages.receiveTimeout);
      case DioExceptionType.badResponse:
        return _handleBadResponse(error);
      case DioExceptionType.cancel:
        return NetworkFailure(message: ErrorMessages.requestCancelled);
      case DioExceptionType.connectionError:
        return NetworkFailure(message: ErrorMessages.connectionError);
      case DioExceptionType.badCertificate:
        return NetworkFailure(message: ErrorMessages.certificateError);
      case DioExceptionType.unknown:
      default:
        return NetworkFailure(message: ErrorMessages.networkError);
    }
  }

  static Failure _handleBadResponse(DioException error) {
    final statusCode = error.response?.statusCode;
    final responseData = error.response?.data;
    print('============= response data $responseData');
    String message = responseData['error']['message'];


    switch (statusCode) {
      case 400:
        return ValidationFailure(
          message: message,
          validationErrors: _extractValidationErrors(responseData),
        );
      case 401:
        return AuthFailure(
          message: message.isEmpty ? ErrorMessages.unauthorizedError : message,
        );
      case 403:
        return AuthFailure(
          message: message.isEmpty ? ErrorMessages.accessForbidden : message,
        );
      case 404:
        return ServerFailure(
          message: message.isEmpty ? ErrorMessages.resourceNotFound : message,
        );
      case 422:
        return ValidationFailure(
          message: message.isEmpty ? ErrorMessages.validationError : message,
          validationErrors: _extractValidationErrors(responseData),
        );
      case 500:
        return ServerFailure(
          message: message.isEmpty
              ? ErrorMessages.internalServerError
              : message,
        );
      case 503:
        return ServerFailure(
          message: message.isEmpty ? ErrorMessages.serviceUnavailable : message,
        );
      default:
        return ServerFailure(message: message);
    }
  }

  static List<String> _extractValidationErrors(dynamic responseData) {
    if (responseData is Map<String, dynamic>) {
      if (responseData.containsKey('error')) {
        final errors = responseData['error'];
        if (errors is Map<String, dynamic>) {
          return errors.values
              .expand((error) => error is List ? error : [error])
              .map((e) => e.toString())
              .toList();
        } else if (errors is List) {
          return errors.map((e) => e.toString()).toList();
        }
      }
    }
    return [];
  }
}
