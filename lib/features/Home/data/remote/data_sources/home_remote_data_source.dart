import 'package:currency_converter_task/core/error/exceptions.dart';
import 'package:currency_converter_task/core/network/service.dart';
import 'package:currency_converter_task/features/Home/data/remote/models/currencies_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDataSource {
  Future<List<CurrencyModel>> getCurrencies();

  Future<num> getConversionRate(String from, String to);

  Future<List<Map<String, dynamic>>> getHistoricalRates(String from,
      String to,);
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final NetworkService _networkService;

  HomeRemoteDataSourceImpl(this._networkService);

  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    final response = await _networkService.getSupportedCurrencies();
    if (response.isSuccessful) {
      return (response.body['data'] as Map<String, dynamic>)
          .values
          .map((e) => CurrencyModel.fromJson(e))
          .toList();
    } else {
      throw ServerException(response.statusCode, response.error.toString());
    }
  }

  @override
  Future<num> getConversionRate(String from, String to) async {
    try {
      final response = await _networkService.getLatestRates(from, [to]);
      if (response.isSuccessful) {
        return num.parse(response.body['data'][to].toString());
      } else {
        throw ServerException(response.statusCode, response.error.toString());
      }
    } catch (e) {
      throw ServerException(500, e.toString());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getHistoricalRates(String from,
      String to) async {
    try {
      final List<Map<String, dynamic>> historicalRates = [];
      for (var i = 0; i < 7; i++) {
        final response = await _networkService.getHistoricalRates(
            from, [to], DateTime
            .now()
            .subtract(Duration(days: i + 1))
            .toIso8601String()
            .split('T')
            .first);
        if (response.isSuccessful) {
          historicalRates.add(response.body['data']);
        } else {
          throw ServerException(
              response.statusCode, response.error.toString());
        }
      }
      return historicalRates;
    } catch (e) {
      throw ServerException(500, e.toString());
    }
  }
}
