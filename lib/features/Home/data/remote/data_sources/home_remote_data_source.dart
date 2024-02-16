import 'package:currency_converter_task/core/error/exceptions.dart';
import 'package:currency_converter_task/core/network/service.dart';
import 'package:currency_converter_task/features/Home/data/remote/models/currencies_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDataSource {
  Future<List<CurrencyModel>> getCurrencies();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  late NetworkService _networkService;

  HomeRemoteDataSourceImpl() {
    _networkService = NetworkService.create();
  }

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
}
