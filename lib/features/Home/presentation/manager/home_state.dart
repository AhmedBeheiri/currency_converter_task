part of 'home_cubit.dart';

@immutable
class HomeState extends Equatable {
  final bool loading;
  final bool conversionLoading;
  final Failure? error;
  final List<CurrencyEntity>? currencies;
  final List<Map<String, dynamic>>? historicalRates;

  final bool historicalLoading;

  final CurrencyEntity? fromCurrency;
  final CurrencyEntity? toCurrency;
  final double? conversionResult;

  final String amount;

  bool isConversionEnabled() =>
      fromCurrency != null &&
      toCurrency != null &&
      fromCurrency != toCurrency &&
      amount.isNotEmpty;

  bool isHistoricalRatesEnabled() =>
      fromCurrency != null && toCurrency != null && fromCurrency != toCurrency;

  HomeState requestLoading() => copyWith(loading: true);

  HomeState historicalRatesLoading() => copyWith(
        historicalLoading: true,
        historicalRates: Nullable(null),
        error: Nullable(null),
      );

  HomeState historicalRatesSuccess(
          List<Map<String, dynamic>>? historicalRates) =>
      copyWith(
        historicalRates: Nullable(historicalRates),
        historicalLoading: false,
        error: Nullable(null),
      );

  HomeState amountChanged(String amount) => copyWith(amount: amount);

  HomeState requestConversionLoading() => copyWith(
        conversionLoading: true,
        error: Nullable(null),
      );

  HomeState requestSuccess(List<CurrencyEntity>? currencies) =>
      copyWith(loading: false, currencies: Nullable(currencies));

  HomeState requestConversionSuccess(double conversionResult) => copyWith(
        conversionLoading: false,
        conversionResult: conversionResult,
        error: Nullable(null),
      );

  HomeState requestFailed(Failure? failure) => copyWith(
        loading: false,
        conversionLoading: false,
        historicalLoading: false,
        error: Nullable(failure),
      );

  HomeState fromCurrencyChanged(CurrencyEntity? fromCurrency) =>
      copyWith(fromCurrency: fromCurrency, conversionResult: null);

  HomeState toCurrencyChanged(CurrencyEntity? toCurrency) => copyWith(
        toCurrency: toCurrency,
        conversionResult: null,
      );

  const HomeState({
    this.loading = false,
    this.conversionLoading = false,
    this.currencies,
    this.fromCurrency,
    this.toCurrency,
    this.conversionResult,
    this.error,
    this.amount = '',
    this.historicalRates,
    this.historicalLoading = false,
  });

  @override
  List<Object?> get props => [
        loading,
        currencies,
        conversionLoading,
        fromCurrency,
        toCurrency,
        conversionResult,
        amount,
        historicalRates,
        historicalLoading,
      ];

  HomeState copyWith({
    bool? loading,
    bool? conversionLoading,
    Nullable<Failure?>? error,
    Nullable<List<CurrencyEntity>?>? currencies,
    Nullable<List<Map<String, dynamic>>?>? historicalRates,
    CurrencyEntity? fromCurrency,
    CurrencyEntity? toCurrency,
    double? conversionResult,
    String? amount,
    bool? historicalLoading,
  }) {
    return HomeState(
      loading: loading ?? this.loading,
      conversionLoading: conversionLoading ?? this.conversionLoading,
      error: error == null ? this.error : error.value,
      currencies: currencies == null ? this.currencies : currencies.value,
      fromCurrency: fromCurrency ?? this.fromCurrency,
      toCurrency: toCurrency ?? this.toCurrency,
      conversionResult: conversionResult ?? this.conversionResult,
      amount: amount ?? this.amount,
      historicalLoading: historicalLoading ?? this.historicalLoading,
      historicalRates: historicalRates == null
          ? this.historicalRates
          : historicalRates.value,
    );
  }
}
