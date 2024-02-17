import 'package:currency_converter_task/core/database/database.dart';
import 'package:currency_converter_task/core/error/exceptions.dart';
import 'package:currency_converter_task/features/Home/data/local/models/currency_local_model.dart';
import 'package:currency_converter_task/features/Home/data/local/data_sources/home_local_data_source.dart';
import 'package:currency_converter_task/features/Home/data/remote/models/currencies_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_tmpl_dir.dart';
@GenerateNiceMocks([
  MockSpec<Box<CurrencyLocalModel>>(),
  MockSpec<HiveInterface>(),
  MockSpec<Database>()
])
import 'home_local_data_source_test.mocks.dart';

void main() async {
  MockHiveInterface mockHive = MockHiveInterface();
  MockBox mockBox = MockBox();
  HomeLocalDataSourceImpl dataSource = HomeLocalDataSourceImpl(
    hive: mockHive,
  );

  setUpAll(() async {
    final tempDir = await getTempDir();
    mockHive.init(tempDir.path);
    mockHive.registerAdapter<CurrencyLocalModel>(CurrencyLocalModelAdapter());
  });

  group('getCurrencies', () {
    test('should throw CacheException when there is an error', () async {
      // Arrange
      when(mockHive.openBox(currenciesBox)).thenThrow(Exception());

      // Act
      final call = dataSource.getCurrencies;

      // Assert
      expect(() => call(), throwsA(isA<CacheException>()));
    });
    test('should return list of currencies when box is not empty', () async {
      // Arrange
      when(mockHive.openBox<CurrencyLocalModel>(currenciesBox))
          .thenAnswer((_) async => mockBox);
      when(mockBox.length).thenAnswer((_) => 1);
      when(mockBox.getAt(0)).thenAnswer((_) => CurrencyLocalModel(
            code: 'USD',
            name: 'United States Dollar',
            symbol: '\$',
          ));

      // Act
      final result = await dataSource.getCurrencies();

      // Assert
      expect(result, isA<List<CurrencyModel>>());
    });
  });

  group('saveCurrencies', () {
    test('should return list of currencies when save is successful', () async {
      // Arrange
      when(mockHive.box<CurrencyLocalModel>(currenciesBox))
          .thenReturn(mockBox);
      when(mockBox.clear()).thenAnswer((_) async => Future.value(1));
      when(mockBox.addAll([])).thenAnswer((_) async => Future.value([1]));

      // Act
      final result = await dataSource.saveCurrencies([
        const CurrencyModel(
          code: 'USD',
          name: 'United States Dollar',
          symbol: '\$',
          decimalDigits: 2,
          namePlural: 'United States Dollars',
          rounding: 0,
          symbolNative: '\$',
          type: 'fiat',
        )
      ]);

      // Assert
      expect(result, isA<List<CurrencyModel>>());
    });

    test('should throw CacheException when there is an error', () async {
      // Arrange
      when(mockHive.box<CurrencyLocalModel>(currenciesBox))
          .thenThrow(Exception());

      // Act
      final call = dataSource.saveCurrencies;

      // Assert
      expect(
          () => call([
                const CurrencyModel(
                    code: 'USD',
                    name: 'United States Dollar',
                    symbol: '\$',
                    decimalDigits: 2,
                    namePlural: 'United States Dollars',
                    rounding: 0,
                    symbolNative: '\$',
                    type: 'fiat')
              ]),
          throwsA(isA<CacheException>()));
    });
  });
}
