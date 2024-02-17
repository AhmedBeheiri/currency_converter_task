import '../../../domain/entities/currency_entity.dart';

class CurrencyModel extends CurrencyEntity {
  final String code;
  final int decimalDigits;
  final String name;
  final String namePlural;
  final int rounding;
  final String symbol;
  final String symbolNative;
  final String type;

  const CurrencyModel(
      {required this.code,
      required this.decimalDigits,
      required this.name,
      required this.namePlural,
      required this.rounding,
      required this.symbol,
      required this.symbolNative,
      required this.type})
      : super(
          currencyName: name,
          currencyCode: code,
          currencySymbol: symbol,
        );

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      code: json['code'],
      decimalDigits: json['decimal_digits'],
      name: json['name'],
      namePlural: json['name_plural'],
      rounding: json['rounding'],
      symbol: json['symbol'],
      symbolNative: json['symbol_native'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['decimal_digits'] = decimalDigits;
    data['name'] = name;
    data['name_plural'] = namePlural;
    data['rounding'] = rounding;
    data['symbol'] = symbol;
    data['symbol_native'] = symbolNative;
    data['type'] = type;
    return data;
  }
}
