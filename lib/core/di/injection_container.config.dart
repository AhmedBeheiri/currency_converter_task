// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_converter_task/core/database/database.dart' as _i10;
import 'package:currency_converter_task/core/network/service.dart' as _i5;
import 'package:currency_converter_task/features/Home/data/local/data_sources/home_local_data_source.dart'
    as _i4;
import 'package:currency_converter_task/features/Home/data/remote/data_sources/home_remote_data_source.dart'
    as _i6;
import 'package:currency_converter_task/features/Home/data/repositories/home_repo_impl.dart'
    as _i8;
import 'package:currency_converter_task/features/Home/domain/repositories/home_repo.dart'
    as _i7;
import 'package:currency_converter_task/features/Home/presentation/manager/home_cubit.dart'
    as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final database = _$Database();
    gh.lazySingleton<_i3.HiveInterface>(() => database.hive);
    gh.lazySingleton<_i4.HomeLocalDataSource>(
        () => _i4.HomeLocalDataSourceImpl(hive: gh<_i3.HiveInterface>()));
    gh.factory<_i5.NetworkService>(() => _i5.NetworkService.init());
    gh.lazySingleton<_i6.HomeRemoteDataSource>(
        () => _i6.HomeRemoteDataSourceImpl(gh<_i5.NetworkService>()));
    gh.lazySingleton<_i7.HomeRepo>(() => _i8.HomeRepoImpl(
          homeRemoteDataSource: gh<_i6.HomeRemoteDataSource>(),
          homeLocalDataSource: gh<_i4.HomeLocalDataSource>(),
        ));
    gh.factory<_i9.HomeCubit>(() => _i9.HomeCubit(gh<_i7.HomeRepo>()));
    return this;
  }
}

class _$Database extends _i10.Database {}
