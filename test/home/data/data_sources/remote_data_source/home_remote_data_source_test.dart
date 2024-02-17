
// ignore_for_file: depend_on_referenced_packages

import 'package:chopper/chopper.dart';
import 'package:currency_converter_task/core/network/service.dart';
import 'package:currency_converter_task/features/Home/data/remote/models/currencies_model.dart';
import 'package:currency_converter_task/features/Home/data/remote/data_sources/home_remote_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

@GenerateNiceMocks([MockSpec<NetworkService>()])
import 'home_remote_data_source_test.mocks.dart';

void main() {
  MockNetworkService mockNetworkService = MockNetworkService();
  HomeRemoteDataSourceImpl dataSource = HomeRemoteDataSourceImpl(
    mockNetworkService,
  );
  setUpAll(() {
    final Map<String, dynamic> body = {'data': {}};
    provideDummy<Response<dynamic>>(Response(
      http.Response(body.toString(), 200),
      body,
    ));
  });

  group('getCurrencies', () {
    final firstCurrency = CurrencyModel.fromJson(const {
      "name": "USD",
      "symbol": '',
      'code': 'USD',
      'decimal_digits': 2,
      'name_plural': 'US dollars',
      'rounding': 0,
      'symbol_native': '',
      'type': 'fiat',
    });
    final secondCurrency = CurrencyModel.fromJson(const {
      "name": "EUR",
      "symbol": "",
      'code': 'EUR',
      'decimal_digits': 2,
      'name_plural': 'euros',
      'rounding': 0,
      'symbol_native': '',
      'type': 'fiat',
    });

    test('should return list of CurrencyModel when the call is successful',
        () async {
      final Map<String, dynamic> body = {
        'data': {
          firstCurrency.code: firstCurrency.toJson(),
          secondCurrency.code: secondCurrency.toJson(),
        }
      };

      // arrange

      when(mockNetworkService.getSupportedCurrencies())
          .thenAnswer((_) async => Response(
                http.Response(body.toString(), 200),
                body,
              ));
      // act
      final result = await dataSource.getCurrencies();
      // assert
      expect(result, equals([firstCurrency, secondCurrency]));
    });
  });
  group('getConversionRate', () {
    const tFromCurrency = "USD";
    const tToCurrency = "EUR";
    const tConversionRate = 0.85;

    test('should return conversion rate when the call is successful',
        () async {
      // arrange
      when(mockNetworkService.getLatestRates(tFromCurrency, [tToCurrency]))
          .thenAnswer((_) async => Response(
                http.Response(
                    '{"data": {"$tToCurrency": $tConversionRate}', 200),
                const {
                  'data': {tToCurrency: tConversionRate}
                },
              ));
      // act
      final result =
          await dataSource.getConversionRate(tFromCurrency, tToCurrency);
      // assert
      expect(result, equals(tConversionRate));
    });
  });

  group('getHistoricalRates', () {
    const tFromCurrency = "USD";
    const tToCurrency = "EUR";
    final tHistoricalRates = {
      '2023-01-02': {tToCurrency: 0.85}
    };

    test('should return list of historical rates when the call is successful',
        () async {
      // arrange
      when(mockNetworkService.getHistoricalRates(
              tFromCurrency, [tToCurrency], any))
          .thenAnswer((_) async => Response(
                http.Response(
                  {'data': tHistoricalRates}.toString(),
                  200,
                ),
                {'data': tHistoricalRates},
              ));
      // act
      final result =
          await dataSource.getHistoricalRates(tFromCurrency, tToCurrency);

      // assert
      expect(result, equals(List.generate(7, (index) => tHistoricalRates)));
    });
  });
}
