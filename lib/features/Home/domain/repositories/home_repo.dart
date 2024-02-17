import 'package:currency_converter_task/core/error/failures.dart';
import 'package:currency_converter_task/features/Home/domain/entities/currency_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CurrencyEntity>>> getCurrencies();
  Future<Either<Failure, num>> getConversionRate(String from, String to);
  Future<Either<Failure, List<Map<String, dynamic>>>> getHistoricalRates(String from, String to);
}
