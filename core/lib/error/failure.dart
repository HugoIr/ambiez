abstract class Failure implements Exception {
  String message;

  Failure({
    this.message = "Error",
  });

  @override
  String toString() {
    return message;
  }
}

class GeneralFailure extends Failure {
  GeneralFailure({
    String? message,
  }) : super(message: message ?? "Failure");
}

class NetworkFailure extends Failure {
  NetworkFailure({
    String? message,
  }) : super(message: message ?? "Network Failure");
}

class TimeoutFailure extends Failure {
  TimeoutFailure({
    String? message,
  }) : super(message: message ?? "Timeout Failure");
}

class NotFoundFailure extends Failure {
  NotFoundFailure({
    String? message,
  }) : super(message: message ?? "Not Found Failure");
}

class BadRequestFailure extends Failure {
  BadRequestFailure({
    String? message,
  }) : super(message: message ?? "Bad Request Failure");
}
