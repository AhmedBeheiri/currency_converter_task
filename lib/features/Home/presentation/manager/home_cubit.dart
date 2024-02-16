import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/currency_entity.dart';
import '../../domain/repositories/home_repo.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepository;

  HomeCubit(this._homeRepository) : super(HomeInitial());

  void getCurrencies() async {
    emit(HomeLoading());
    final result = await _homeRepository.getCurrencies();
    result.fold(
      (failure) => emit(HomeError((failure as ServerFailure).error)),
      (currencies) => emit(CurrenciesLoaded(currencies)),
    );
  }

  void setFromCurrency(CurrencyEntity? currency) {
    emit((state as CurrenciesLoaded).copyWith(
      fromCurrency: currency,
      conversionRate: null,
    ));
  }

  void setToCurrency(CurrencyEntity? currency) {
    emit((state as CurrenciesLoaded).copyWith(
      toCurrency: currency,
      conversionRate: null,
    ));
  }

  void convertCurrency(String from, String to) async {
    emit((state as CurrenciesLoaded).copyWith(loading: true));
    final result = await _homeRepository.getConversionRate(from, to);
    result.fold(
      (failure) => emit(HomeError((failure as ServerFailure).error)),
      (rate) => emit(
        (state as CurrenciesLoaded).copyWith(
          conversionRate: rate.toDouble(),
          loading: false,
        ),
      ),
    );
  }
}
