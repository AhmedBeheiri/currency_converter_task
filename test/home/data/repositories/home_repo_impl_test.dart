import 'package:currency_converter_task/core/error/exceptions.dart';
import 'package:currency_converter_task/core/error/failures.dart';
import 'package:currency_converter_task/features/Home/data/local/data_sources/home_local_data_source.dart';
import 'package:currency_converter_task/features/Home/data/remote/models/currencies_model.dart';
import 'package:currency_converter_task/features/Home/data/repositories/home_repo_impl.dart';
import 'package:currency_converter_task/features/Home/domain/repositories/home_repo.dart';
import 'package:currency_converter_task/features/Home/data/remote/data_sources/home_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
@GenerateNiceMocks([MockSpec<HomeRemoteDataSource>(), MockSpec<HomeLocalDataSource>()])
import 'home_repo_impl_test.mocks.dart';

void main() {
  late HomeRepo homeRepo;
  late MockHomeRemoteDataSource mockRemoteDataSource;
  late MockHomeLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockHomeRemoteDataSource();
    mockLocalDataSource = MockHomeLocalDataSource();
    homeRepo = HomeRepoImpl(
      homeRemoteDataSource: mockRemoteDataSource,
      homeLocalDataSource: mockLocalDataSource,
    );
  });

  group('getCurrencies', () {
    final testCurrencyList = [
      const CurrencyModel(
        code: 'USD',
        name: 'US Dollar',
        symbol: '\$',
        decimalDigits: 2,
        namePlural: 'US dollars',
        rounding: 0,
        symbolNative: '\$',
        type: 'fiat',
      )
    ];

    test('should return currency list from local data source when available',
        () async {
      // Arrange
      when(mockLocalDataSource.getCurrencies())
          .thenAnswer((_) async => Future.value(testCurrencyList));

      // Act
      final result = await homeRepo.getCurrencies();

      // Assert
      verify(mockLocalDataSource.getCurrencies());
      expect(result, Right(testCurrencyList));
    });

    test(
        'should return currency list from remote data source when not available locally',
        () async {
      // Arrange
      when(mockLocalDataSource.getCurrencies()).thenAnswer((_) async => []);
      when(mockRemoteDataSource.getCurrencies())
          .thenAnswer((_) async => Future.value(testCurrencyList));
      when(mockLocalDataSource.saveCurrencies(testCurrencyList))
          .thenAnswer((_) async => Future.value(testCurrencyList));

      // Act
      final result = await homeRepo.getCurrencies();

      // Assert
      verify(mockLocalDataSource.getCurrencies());
      verify(mockRemoteDataSource.getCurrencies());
      verify(mockLocalDataSource.saveCurrencies(testCurrencyList));
      expect(result, Right(testCurrencyList));
    });

    test('should return failure when server exception occurs', () async {
      // Arrange
      when(mockLocalDataSource.getCurrencies())
          .thenThrow(const CacheException('Cache Exception'));

      // Act
      final result = await homeRepo.getCurrencies();

      // Assert
      expect(result, Left(CacheFailure(error: 'Cache Exception')));
    });
  });
  group('getConversionRate', () {
    const testFromCurrency = 'USD';
    const testToCurrency = 'EUR';
    const testConversionRate = 0.85;

    test('should return conversion rate from remote data source', () async {
      // Arrange
      when(mockRemoteDataSource.getConversionRate(
              testFromCurrency, testToCurrency))
          .thenAnswer((_) async => testConversionRate);

      // Act
      final result =
          await homeRepo.getConversionRate(testFromCurrency, testToCurrency);

      // Assert
      verify(mockRemoteDataSource.getConversionRate(
          testFromCurrency, testToCurrency));
      expect(result, const Right(testConversionRate));
    });

    test('should return failure when server exception occurs', () async {
      // Arrange
      when(mockRemoteDataSource.getConversionRate(
              testFromCurrency, testToCurrency))
          .thenThrow(const ServerException(400, 'Server Exception'));

      // Act
      final result =
          await homeRepo.getConversionRate(testFromCurrency, testToCurrency);

      // Assert
      expect(
        result,
        Left(
          ServerFailure(
            statusCode: 400,
            error: 'Server Exception',
          ),
        ),
      );
    });
  });

  group('getHistoricalRates', () {
    const testFromCurrency = 'USD';
    const testToCurrency = 'EUR';
    final testHistoricalRates = [
      {'date': '2024-02-15', 'rate': 0.85},
      {'date': '2024-02-16', 'rate': 0.84},
      {'date': '2024-02-17', 'rate': 0.86},
    ];

    test('should return historical rates from remote data source', () async {
      // Arrange
      when(mockRemoteDataSource.getHistoricalRates(
              testFromCurrency, testToCurrency))
          .thenAnswer((_) async => testHistoricalRates);

      // Act
      final result =
          await homeRepo.getHistoricalRates(testFromCurrency, testToCurrency);

      // Assert
      verify(mockRemoteDataSource.getHistoricalRates(
          testFromCurrency, testToCurrency));
      expect(result, Right(testHistoricalRates));
    });

    test('should return failure when server exception occurs', () async {
      // Arrange
      when(mockRemoteDataSource.getHistoricalRates(
              testFromCurrency, testToCurrency))
          .thenThrow(const ServerException(
              500, 'Server Exception: Internal Server Error'));

      // Act
      final result =
          await homeRepo.getHistoricalRates(testFromCurrency, testToCurrency);

      // Assert
      expect(
        result,
        Left(
          ServerFailure(
            statusCode: 500,
            error: 'Server Exception: Internal Server Error',
          ),
        ),
      );
    });
  });
  // Write similar test blocks for getConversionRate and getHistoricalRates methods
}
