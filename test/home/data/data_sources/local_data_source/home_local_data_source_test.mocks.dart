// Mocks generated by Mockito 5.4.4 from annotations
// in currency_converter_task/test/home/data/data_sources/local_data_source/home_local_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:typed_data' as _i8;

import 'package:currency_converter_task/core/database/database.dart' as _i9;
import 'package:currency_converter_task/features/Home/data/local/models/currency_local_model.dart'
    as _i3;
import 'package:hive/hive.dart' as _i2;
import 'package:hive/src/box/default_compaction_strategy.dart' as _i7;
import 'package:hive/src/box/default_key_comparator.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBox_0<E1> extends _i1.SmartFake implements _i2.Box<E1> {
  _FakeBox_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLazyBox_1<E1> extends _i1.SmartFake implements _i2.LazyBox<E1> {
  _FakeLazyBox_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeHiveInterface_2 extends _i1.SmartFake implements _i2.HiveInterface {
  _FakeHiveInterface_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [Box].
///
/// See the documentation for Mockito's code generation for more information.
class MockBox extends _i1.Mock implements _i2.Box<_i3.CurrencyLocalModel> {
  @override
  Iterable<_i3.CurrencyLocalModel> get values => (super.noSuchMethod(
        Invocation.getter(#values),
        returnValue: <_i3.CurrencyLocalModel>[],
        returnValueForMissingStub: <_i3.CurrencyLocalModel>[],
      ) as Iterable<_i3.CurrencyLocalModel>);

  @override
  String get name => (super.noSuchMethod(
        Invocation.getter(#name),
        returnValue: _i4.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
        returnValueForMissingStub: _i4.dummyValue<String>(
          this,
          Invocation.getter(#name),
        ),
      ) as String);

  @override
  bool get isOpen => (super.noSuchMethod(
        Invocation.getter(#isOpen),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get lazy => (super.noSuchMethod(
        Invocation.getter(#lazy),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  Iterable<dynamic> get keys => (super.noSuchMethod(
        Invocation.getter(#keys),
        returnValue: <dynamic>[],
        returnValueForMissingStub: <dynamic>[],
      ) as Iterable<dynamic>);

  @override
  int get length => (super.noSuchMethod(
        Invocation.getter(#length),
        returnValue: 0,
        returnValueForMissingStub: 0,
      ) as int);

  @override
  bool get isEmpty => (super.noSuchMethod(
        Invocation.getter(#isEmpty),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get isNotEmpty => (super.noSuchMethod(
        Invocation.getter(#isNotEmpty),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  Iterable<_i3.CurrencyLocalModel> valuesBetween({
    dynamic startKey,
    dynamic endKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #valuesBetween,
          [],
          {
            #startKey: startKey,
            #endKey: endKey,
          },
        ),
        returnValue: <_i3.CurrencyLocalModel>[],
        returnValueForMissingStub: <_i3.CurrencyLocalModel>[],
      ) as Iterable<_i3.CurrencyLocalModel>);

  @override
  _i3.CurrencyLocalModel? getAt(int? index) => (super.noSuchMethod(
        Invocation.method(
          #getAt,
          [index],
        ),
        returnValueForMissingStub: null,
      ) as _i3.CurrencyLocalModel?);

  @override
  Map<dynamic, _i3.CurrencyLocalModel> toMap() => (super.noSuchMethod(
        Invocation.method(
          #toMap,
          [],
        ),
        returnValue: <dynamic, _i3.CurrencyLocalModel>{},
        returnValueForMissingStub: <dynamic, _i3.CurrencyLocalModel>{},
      ) as Map<dynamic, _i3.CurrencyLocalModel>);

  @override
  dynamic keyAt(int? index) => super.noSuchMethod(
        Invocation.method(
          #keyAt,
          [index],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Stream<_i2.BoxEvent> watch({dynamic key}) => (super.noSuchMethod(
        Invocation.method(
          #watch,
          [],
          {#key: key},
        ),
        returnValue: _i5.Stream<_i2.BoxEvent>.empty(),
        returnValueForMissingStub: _i5.Stream<_i2.BoxEvent>.empty(),
      ) as _i5.Stream<_i2.BoxEvent>);

  @override
  bool containsKey(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #containsKey,
          [key],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i5.Future<void> put(
    dynamic key,
    _i3.CurrencyLocalModel? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [
            key,
            value,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> putAt(
    int? index,
    _i3.CurrencyLocalModel? value,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #putAt,
          [
            index,
            value,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> putAll(Map<dynamic, _i3.CurrencyLocalModel>? entries) =>
      (super.noSuchMethod(
        Invocation.method(
          #putAll,
          [entries],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<int> add(_i3.CurrencyLocalModel? value) => (super.noSuchMethod(
        Invocation.method(
          #add,
          [value],
        ),
        returnValue: _i5.Future<int>.value(0),
        returnValueForMissingStub: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<Iterable<int>> addAll(Iterable<_i3.CurrencyLocalModel>? values) =>
      (super.noSuchMethod(
        Invocation.method(
          #addAll,
          [values],
        ),
        returnValue: _i5.Future<Iterable<int>>.value(<int>[]),
        returnValueForMissingStub: _i5.Future<Iterable<int>>.value(<int>[]),
      ) as _i5.Future<Iterable<int>>);

  @override
  _i5.Future<void> delete(dynamic key) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [key],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteAt(int? index) => (super.noSuchMethod(
        Invocation.method(
          #deleteAt,
          [index],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteAll(Iterable<dynamic>? keys) => (super.noSuchMethod(
        Invocation.method(
          #deleteAll,
          [keys],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> compact() => (super.noSuchMethod(
        Invocation.method(
          #compact,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<int> clear() => (super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValue: _i5.Future<int>.value(0),
        returnValueForMissingStub: _i5.Future<int>.value(0),
      ) as _i5.Future<int>);

  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteFromDisk() => (super.noSuchMethod(
        Invocation.method(
          #deleteFromDisk,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> flush() => (super.noSuchMethod(
        Invocation.method(
          #flush,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}

/// A class which mocks [HiveInterface].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveInterface extends _i1.Mock implements _i2.HiveInterface {
  @override
  void init(
    String? path, {
    _i2.HiveStorageBackendPreference? backendPreference =
        _i2.HiveStorageBackendPreference.native,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #init,
          [path],
          {#backendPreference: backendPreference},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<_i2.Box<E>> openBox<E>(
    String? name, {
    _i2.HiveCipher? encryptionCipher,
    _i2.KeyComparator? keyComparator = _i6.defaultKeyComparator,
    _i2.CompactionStrategy? compactionStrategy = _i7.defaultCompactionStrategy,
    bool? crashRecovery = true,
    String? path,
    _i8.Uint8List? bytes,
    String? collection,
    List<int>? encryptionKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #openBox,
          [name],
          {
            #encryptionCipher: encryptionCipher,
            #keyComparator: keyComparator,
            #compactionStrategy: compactionStrategy,
            #crashRecovery: crashRecovery,
            #path: path,
            #bytes: bytes,
            #collection: collection,
            #encryptionKey: encryptionKey,
          },
        ),
        returnValue: _i5.Future<_i2.Box<E>>.value(_FakeBox_0<E>(
          this,
          Invocation.method(
            #openBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #bytes: bytes,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
        returnValueForMissingStub: _i5.Future<_i2.Box<E>>.value(_FakeBox_0<E>(
          this,
          Invocation.method(
            #openBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #bytes: bytes,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
      ) as _i5.Future<_i2.Box<E>>);

  @override
  _i5.Future<_i2.LazyBox<E>> openLazyBox<E>(
    String? name, {
    _i2.HiveCipher? encryptionCipher,
    _i2.KeyComparator? keyComparator = _i6.defaultKeyComparator,
    _i2.CompactionStrategy? compactionStrategy = _i7.defaultCompactionStrategy,
    bool? crashRecovery = true,
    String? path,
    String? collection,
    List<int>? encryptionKey,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #openLazyBox,
          [name],
          {
            #encryptionCipher: encryptionCipher,
            #keyComparator: keyComparator,
            #compactionStrategy: compactionStrategy,
            #crashRecovery: crashRecovery,
            #path: path,
            #collection: collection,
            #encryptionKey: encryptionKey,
          },
        ),
        returnValue: _i5.Future<_i2.LazyBox<E>>.value(_FakeLazyBox_1<E>(
          this,
          Invocation.method(
            #openLazyBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i2.LazyBox<E>>.value(_FakeLazyBox_1<E>(
          this,
          Invocation.method(
            #openLazyBox,
            [name],
            {
              #encryptionCipher: encryptionCipher,
              #keyComparator: keyComparator,
              #compactionStrategy: compactionStrategy,
              #crashRecovery: crashRecovery,
              #path: path,
              #collection: collection,
              #encryptionKey: encryptionKey,
            },
          ),
        )),
      ) as _i5.Future<_i2.LazyBox<E>>);

  @override
  _i2.Box<E> box<E>(String? name) => (super.noSuchMethod(
        Invocation.method(
          #box,
          [name],
        ),
        returnValue: _FakeBox_0<E>(
          this,
          Invocation.method(
            #box,
            [name],
          ),
        ),
        returnValueForMissingStub: _FakeBox_0<E>(
          this,
          Invocation.method(
            #box,
            [name],
          ),
        ),
      ) as _i2.Box<E>);

  @override
  _i2.LazyBox<E> lazyBox<E>(String? name) => (super.noSuchMethod(
        Invocation.method(
          #lazyBox,
          [name],
        ),
        returnValue: _FakeLazyBox_1<E>(
          this,
          Invocation.method(
            #lazyBox,
            [name],
          ),
        ),
        returnValueForMissingStub: _FakeLazyBox_1<E>(
          this,
          Invocation.method(
            #lazyBox,
            [name],
          ),
        ),
      ) as _i2.LazyBox<E>);

  @override
  bool isBoxOpen(String? name) => (super.noSuchMethod(
        Invocation.method(
          #isBoxOpen,
          [name],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i5.Future<void> close() => (super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteBoxFromDisk(
    String? name, {
    String? path,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteBoxFromDisk,
          [name],
          {#path: path},
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> deleteFromDisk() => (super.noSuchMethod(
        Invocation.method(
          #deleteFromDisk,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  List<int> generateSecureKey() => (super.noSuchMethod(
        Invocation.method(
          #generateSecureKey,
          [],
        ),
        returnValue: <int>[],
        returnValueForMissingStub: <int>[],
      ) as List<int>);

  @override
  _i5.Future<bool> boxExists(
    String? name, {
    String? path,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #boxExists,
          [name],
          {#path: path},
        ),
        returnValue: _i5.Future<bool>.value(false),
        returnValueForMissingStub: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  void resetAdapters() => super.noSuchMethod(
        Invocation.method(
          #resetAdapters,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void registerAdapter<T>(
    _i2.TypeAdapter<T>? adapter, {
    bool? internal = false,
    bool? override = false,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #registerAdapter,
          [adapter],
          {
            #internal: internal,
            #override: override,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool isAdapterRegistered(int? typeId) => (super.noSuchMethod(
        Invocation.method(
          #isAdapterRegistered,
          [typeId],
        ),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  void ignoreTypeId<T>(int? typeId) => super.noSuchMethod(
        Invocation.method(
          #ignoreTypeId,
          [typeId],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [Database].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabase extends _i1.Mock implements _i9.Database {
  @override
  _i2.HiveInterface get hive => (super.noSuchMethod(
        Invocation.getter(#hive),
        returnValue: _FakeHiveInterface_2(
          this,
          Invocation.getter(#hive),
        ),
        returnValueForMissingStub: _FakeHiveInterface_2(
          this,
          Invocation.getter(#hive),
        ),
      ) as _i2.HiveInterface);
}
