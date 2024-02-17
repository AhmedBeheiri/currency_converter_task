// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:currency_converter_task/features/Home/data/local/data_sources/home_local_remote_data_source.dart'
    as _i3;
import 'package:currency_converter_task/features/Home/data/remote/data_sources/home_remote_data_source.dart'
    as _i4;
import 'package:currency_converter_task/features/Home/data/repositories/home_repo_impl.dart'
    as _i6;
import 'package:currency_converter_task/features/Home/domain/repositories/home_repo.dart'
    as _i5;
import 'package:currency_converter_task/features/Home/presentation/manager/home_cubit.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
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
    gh.lazySingleton<_i3.HomeLocalDataSource>(
        () => _i3.HomeLocalDataSourceImpl());
    gh.lazySingleton<_i4.HomeRemoteDataSource>(
        () => _i4.HomeRemoteDataSourceImpl());
    gh.lazySingleton<_i5.HomeRepo>(() => _i6.HomeRepoImpl(
          homeRemoteDataSource: gh<_i4.HomeRemoteDataSource>(),
          homeLocalDataSource: gh<_i3.HomeLocalDataSource>(),
        ));
    gh.factory<_i7.HomeCubit>(() => _i7.HomeCubit(gh<_i5.HomeRepo>()));
    return this;
  }
}
