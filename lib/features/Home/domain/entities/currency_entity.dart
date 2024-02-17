import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final String currencyName;
  final String currencyCode;
  final String currencySymbol;

  const CurrencyEntity({
    required this.currencyName,
    required this.currencyCode,
    required this.currencySymbol,
  });

  @override
  List<Object?> get props => [currencyName, currencyCode, currencySymbol];
}
