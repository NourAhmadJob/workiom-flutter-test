class ConnectionExceptions implements Exception {}

class ServerException implements Exception {
  final int? statusCode;
  final String message;

  ServerException({this.statusCode, required this.message});
}

class AuthException implements Exception {
  final String message;

  AuthException({required this.message});
}