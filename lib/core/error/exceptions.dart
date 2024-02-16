
import 'package:equatable/equatable.dart';


class ErrorException extends Equatable implements Exception {
  const ErrorException(this.statusCode, this.error);

  final int statusCode;
  final String error;

  @override
  List<Object?> get props => [statusCode, error];
}

class ServerException extends Equatable implements Exception {
  const ServerException(this.statusCode, this.error);
  final int statusCode;
  final String error;

  @override
  List<Object?> get props => [statusCode, error];
}

class CacheException extends Equatable implements Exception {
  const CacheException(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}


