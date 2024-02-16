part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class CurrenciesLoaded extends HomeState {
  final List<CurrencyEntity> currencies;
  final CurrencyEntity? fromCurrency;
  final CurrencyEntity? toCurrency;
  final double? conversionRate;
  final bool loading;

  const CurrenciesLoaded(
    this.currencies, {
    this.fromCurrency,
    this.toCurrency,
    this.conversionRate,
        this.loading = false,
  });

  @override
  List<Object?> get props => [
        currencies,
        fromCurrency,
        toCurrency,
        conversionRate,
    loading,
      ];

  CurrenciesLoaded copyWith({
    List<CurrencyEntity>? currencies,
    CurrencyEntity? fromCurrency,
    CurrencyEntity? toCurrency,
    double? conversionRate,
    bool? loading,
  }) {
    return CurrenciesLoaded(
      this.currencies,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      conversionRate: conversionRate ?? this.conversionRate,
      loading: loading ?? this.loading,
    );
  }
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object> get props => [message];
}
