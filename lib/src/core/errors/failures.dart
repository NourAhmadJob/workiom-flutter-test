abstract class Failure {
  final String? message;

  Failure({ this.message});
}

class AuthFailure extends Failure {
  AuthFailure({super.message});
}

class ServerFailure extends Failure {


  ServerFailure({required super.message});
}

class NetworkFailure extends Failure {


  NetworkFailure({required super.message});
}

class ValidationFailure extends Failure {
  final List<String> validationErrors;

  ValidationFailure({super.message, required this.validationErrors});

  List<Object> get props => [message ?? '', validationErrors];
}