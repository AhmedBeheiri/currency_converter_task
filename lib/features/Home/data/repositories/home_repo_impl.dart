import 'package:currency_converter_task/core/error/failures.dart';
import 'package:currency_converter_task/features/Home/domain/entities/currency_entity.dart';
import 'package:currency_converter_task/features/Home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../local/data_sources/home_local_data_source.dart';
import '../remote/data_sources/home_remote_data_source.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final HomeLocalDataSource _homeLocalDataSource;

  const HomeRepoImpl({
    required HomeRemoteDataSource homeRemoteDataSource,
    required HomeLocalDataSource homeLocalDataSource,
  })  : _homeRemoteDataSource = homeRemoteDataSource,
        _homeLocalDataSource = homeLocalDataSource;

  @override
  Future<Either<Failure, List<CurrencyEntity>>> getCurrencies() async {
    try {
      final localCurrencies = await _homeLocalDataSource.getCurrencies();
      if(localCurrencies.isNotEmpty) {
        return Right(localCurrencies);
      }
      final currencies = await _homeRemoteDataSource.getCurrencies();
      await _homeLocalDataSource.saveCurrencies(currencies);
      return Right(currencies);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, error: e.error));
    } on CacheException catch (e) {
      return Left(CacheFailure(error: e.error));
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

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getHistoricalRates(
      String from, String to) async {
    try {
      final historicalRates =
          await _homeRemoteDataSource.getHistoricalRates(from, to);
      return Right(historicalRates);
    } on ServerException catch (e) {
      return Left(ServerFailure(statusCode: e.statusCode, error: e.error));
    }
  }
}
