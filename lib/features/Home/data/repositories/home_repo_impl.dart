import 'package:currency_converter_task/core/error/failures.dart';
import 'package:currency_converter_task/features/Home/domain/entities/currency_entity.dart';
import 'package:currency_converter_task/features/Home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../remote/data_sources/home_remote_data_source.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  const HomeRepoImpl({
    required HomeRemoteDataSource homeRemoteDataSource,
  }) : _homeRemoteDataSource = homeRemoteDataSource;

  @override
  Future<Either<Failure, List<CurrencyEntity>>> getCurrencies() async {
    try {
      final currencies = await _homeRemoteDataSource.getCurrencies();
      return Right(currencies);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, error: e.error));
    }
  }

  @override
  Future<Either<Failure, num>> getConversionRate(
      String from, String to) async {
    try {
      final rate = await _homeRemoteDataSource.getConversionRate(from, to);
      return Right(rate);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, error: e.error));
    }
  }
}
