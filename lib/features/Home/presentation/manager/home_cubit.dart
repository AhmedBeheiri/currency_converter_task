import 'package:bloc/bloc.dart';
import 'package:currency_converter_task/core/utils/nullable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/currency_entity.dart';
import '../../domain/repositories/home_repo.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepository;

  HomeCubit(this._homeRepository) : super(const HomeState());

  void getCurrencies() async {
    emit(state.requestLoading());
    final result = await _homeRepository.getCurrencies();
    result.fold(
      (failure) => emit(state.requestFailed(failure)),
      (currencies) => emit(state.requestSuccess(currencies)),
    );
  }

  void setFromCurrency(CurrencyEntity? currency) {
    emit(state.fromCurrencyChanged(currency));
  }

  void setToCurrency(CurrencyEntity? currency) {
    emit(state.toCurrencyChanged(currency));
  }

  void changeAmount(String amount) {
    emit(state.amountChanged(amount));
  }

  void convertCurrency() async {
    emit(state.requestConversionLoading());
    final result = await _homeRepository.getConversionRate(
        state.fromCurrency!.currencyCode, state.toCurrency!.currencyCode);
    result.fold(
      (failure) => emit(state.requestFailed(failure as ServerFailure)),
      (rate) {
        final result = num.parse(state.amount) * rate;
        emit(
          state.requestConversionSuccess(result.toDouble()),
        );
      },
    );
  }

  void getHistoricalRates() async {
    emit(state.historicalRatesLoading());
    final result = await _homeRepository.getHistoricalRates(
        state.fromCurrency!.currencyCode, state.toCurrency!.currencyCode);
    result.fold(
      (failure) => emit(state.requestFailed(failure as ServerFailure)),
      (historicalRates) => emit(state.historicalRatesSuccess(historicalRates)),
    );
  }
}
