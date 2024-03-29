import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final id = (DateTime.now().millisecondsSinceEpoch ~/ 1000).toString();
  final String message;

   Failure({
    required this.message,
  });
}

class ServerFailure extends Failure {
  final int statusCode;
  final String error;

  @override
  List<Object?> get props => [statusCode, error];

  ServerFailure({
    required this.statusCode,
    required this.error,
  }): super(message: error);
}

class CacheFailure extends Failure {
  final String error;

  @override
  List<Object?> get props => [error];

  CacheFailure({
    required this.error,
  }): super(message: error);
}
