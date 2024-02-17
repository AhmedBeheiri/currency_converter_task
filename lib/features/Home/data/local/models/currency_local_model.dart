import 'package:currency_converter_task/features/Home/data/remote/models/currencies_model.dart';
import 'package:hive/hive.dart';
part 'currency_local_model.g.dart';


@HiveType(typeId: 0)
class CurrencyLocalModel extends HiveObject {
  @HiveField(0)
  String code;
  @HiveField(1)
  String name;

  @HiveField(2)
  String symbol;

  CurrencyLocalModel({
    required this.code,
    required this.name,
    required this.symbol,
  });

  factory CurrencyLocalModel.fromCurrencyModel(CurrencyModel currencyModel) {
    return CurrencyLocalModel(
      code: currencyModel.code,
      name: currencyModel.name,
      symbol: currencyModel.symbol,
    );
  }

  CurrencyModel toCurrencyModel() {
    return CurrencyModel(
      code: code,
      name: name,
      symbol: symbol,
      decimalDigits: 0,
      namePlural: '',
      rounding: 0,
      symbolNative: symbol,
      type: '',
    );
  }
}
