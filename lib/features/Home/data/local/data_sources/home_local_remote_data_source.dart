import 'package:currency_converter_task/core/error/exceptions.dart';
import 'package:currency_converter_task/features/Home/data/local/models/currency_local_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../remote/models/currencies_model.dart';

const String currenciesBox = 'CurrenciesBox';

abstract class HomeLocalDataSource {
  Future<List<CurrencyModel>> getCurrencies();

  Future<List<CurrencyModel>> saveCurrencies(List<CurrencyModel> currencies);
}

@LazySingleton(as: HomeLocalDataSource)
class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  Future<List<CurrencyModel>> getCurrencies() async {
    try {
      var box = await Hive.openBox<CurrencyLocalModel>(currenciesBox);
      List<CurrencyModel> currencies = [];
      for (var i = 0; i < box.length; i++) {
        if (box.getAt(i) != null) {
          currencies.add(box.getAt(i)!.toCurrencyModel());
        }
      }
      return currencies;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }

  @override
  Future<List<CurrencyModel>> saveCurrencies(
      List<CurrencyModel> currencies) async {
    try {
      var box = Hive.box<CurrencyLocalModel>(currenciesBox);
      await box.clear();
      await box.addAll(
          currencies.map((e) => CurrencyLocalModel.fromCurrencyModel(e)));
      return currencies;
    } catch (e) {
      throw CacheException(e.toString());
    }
  }
}
