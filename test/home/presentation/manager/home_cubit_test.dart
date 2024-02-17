import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter_task/features/Home/domain/entities/currency_entity.dart';
import 'package:currency_converter_task/features/Home/domain/repositories/home_repo.dart';
import 'package:currency_converter_task/features/Home/presentation/manager/home_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks([MockSpec<HomeRepo>()])
import 'home_cubit_test.mocks.dart';

void main() {
  late MockHomeRepo mockHomeRepo;
  late HomeCubit homeCubit;

  setUp(() {
    mockHomeRepo = MockHomeRepo();
    homeCubit = HomeCubit(mockHomeRepo);
  });

  group('HomeCubit', () {
    final testCurrencies = [
      const CurrencyEntity(
        currencyName: 'US Dollar',
        currencyCode: 'USD',
        currencySymbol: '\$',
      )
    ];
    const testConversionRate = 0.85;
    final testHistoricalRates = [
      {'date': '2024-02-15', 'rate': 0.85},
      {'date': '2024-02-16', 'rate': 0.84},
      {'date': '2024-02-17', 'rate': 0.86},
    ];

    blocTest<HomeCubit, HomeState>(
      'emits [loading, success] when getCurrencies is called successfully',
      build: () {
        when(mockHomeRepo.getCurrencies())
            .thenAnswer((_) async => Right(testCurrencies));
        return homeCubit;
      },
      act: (cubit) => cubit.getCurrencies(),
      expect: () => [
        const HomeState().requestLoading(),
        const HomeState().requestSuccess(testCurrencies),
      ],
    );

    // Similar tests for other methods like setFromCurrency, setToCurrency, changeAmount, etc.

    blocTest<HomeCubit, HomeState>(
      'emits [conversionLoading, conversionSuccess] when convertCurrency is called successfully',

      build: () {

        when(mockHomeRepo.getConversionRate('USD', 'EUR'))
            .thenAnswer((_) async => const Right(testConversionRate));
        return homeCubit;
      },
      act: (cubit) {
        cubit.setFromCurrency(const CurrencyEntity(
            currencyCode: 'USD',
            currencyName: 'US Dollar',
            currencySymbol: '\$'));
        cubit.setToCurrency(const CurrencyEntity(
          currencyCode: 'EUR',
          currencyName: 'Euro',
          currencySymbol: '€',
        ));
        cubit.changeAmount('10');
        cubit.convertCurrency();
      },
      expect: () => [
        const HomeState().fromCurrencyChanged(const CurrencyEntity(
          currencyCode: 'USD',
          currencyName: 'US Dollar',
          currencySymbol: '\$',
        )),
        const HomeState(
          fromCurrency: CurrencyEntity(
            currencyCode: 'USD',
            currencyName: 'US Dollar',
            currencySymbol: '\$',
          ),
        ).toCurrencyChanged(const CurrencyEntity(
          currencyCode: 'EUR',
          currencyName: 'Euro',
          currencySymbol: '€',
        )),
        const HomeState(
          fromCurrency: CurrencyEntity(
            currencyCode: 'USD',
            currencyName: 'US Dollar',
            currencySymbol: '\$',
          ),
          toCurrency: CurrencyEntity(
            currencyCode: 'EUR',
            currencyName: 'Euro',
            currencySymbol: '€',
          ),
        ).amountChanged('10'),
        const HomeState(
          fromCurrency: CurrencyEntity(
            currencyCode: 'USD',
            currencyName: 'US Dollar',
            currencySymbol: '\$',
          ),
          toCurrency: CurrencyEntity(
            currencyCode: 'EUR',
            currencyName: 'Euro',
            currencySymbol: '€',
          ),
          amount: '10',
        ).requestConversionLoading(),
        const HomeState(
          fromCurrency: CurrencyEntity(
            currencyCode: 'USD',
            currencyName: 'US Dollar',
            currencySymbol: '\$',
          ),
          toCurrency: CurrencyEntity(
            currencyCode: 'EUR',
            currencyName: 'Euro',
            currencySymbol: '€',
          ),
          amount: '10',
        ).requestConversionSuccess(8.5),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [historicalRatesLoading, historicalRatesSuccess] when getHistoricalRates is called successfully',
      build: () {
        when(mockHomeRepo.getHistoricalRates('USD', 'EUR'))
            .thenAnswer((_) async => Right(testHistoricalRates));
        return homeCubit;
      },
      act: (cubit) {
        cubit.setFromCurrency(const CurrencyEntity(
            currencyCode: 'USD',
            currencyName: 'US Dollar',
            currencySymbol: '\$'));
        cubit.setToCurrency(const CurrencyEntity(
          currencyCode: 'EUR',
          currencyName: 'Euro',
          currencySymbol: '€',
        ));
        cubit.getHistoricalRates();
      },
      expect: () => [
        const HomeState().fromCurrencyChanged(const CurrencyEntity(
          currencyCode: 'USD',
          currencyName: 'US Dollar',
          currencySymbol: '\$',
        )),
        const HomeState(
          fromCurrency: CurrencyEntity(
            currencyCode: 'USD',
            currencyName: 'US Dollar',
            currencySymbol: '\$',
          ),
        ).toCurrencyChanged(const CurrencyEntity(
          currencyCode: 'EUR',
          currencyName: 'Euro',
          currencySymbol: '€',
        )),
        const HomeState(
          fromCurrency: CurrencyEntity(
            currencyCode: 'USD',
            currencyName: 'US Dollar',
            currencySymbol: '\$',
          ),
          toCurrency: CurrencyEntity(
            currencyCode: 'EUR',
            currencyName: 'Euro',
            currencySymbol: '€',
          ),
        ).historicalRatesLoading(),
        const HomeState(
          fromCurrency: CurrencyEntity(
            currencyCode: 'USD',
            currencyName: 'US Dollar',
            currencySymbol: '\$',
          ),
          toCurrency: CurrencyEntity(
            currencyCode: 'EUR',
            currencyName: 'Euro',
            currencySymbol: '€',
          ),
        ).historicalRatesSuccess(testHistoricalRates),
      ],
    );
  });
}
