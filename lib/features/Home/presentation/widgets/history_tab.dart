import 'package:currency_converter_task/features/Home/presentation/widgets/drop_down_custom_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/currency_entity.dart';
import '../manager/home_cubit.dart';
import 'package:darty_commons/darty_commons.dart';

class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text('From',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.fromCurrency != current.fromCurrency ||
                  previous.currencies != current.currencies,
              builder: (context, state) {
                return DropdownButton<CurrencyEntity>(
                    isExpanded: true,
                    value: state.fromCurrency,
                    items: state.currencies
                            ?.map(
                              (e) => DropdownMenuItem<CurrencyEntity>(
                                value: e,
                                child: DropDownCustomItem(value: e),
                              ),
                            )
                            .toList() ??
                        [],
                    onChanged: (value) {
                      context.read<HomeCubit>().setFromCurrency(value);
                    });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('To',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.toCurrency != current.toCurrency ||
                  previous.currencies != current.currencies,
              builder: (context, state) {
                return DropdownButton<CurrencyEntity>(
                    isExpanded: true,
                    value: state.toCurrency,
                    items: state.currencies
                            ?.map(
                              (e) => DropdownMenuItem<CurrencyEntity>(
                                value: e,
                                child: DropDownCustomItem(value: e),
                              ),
                            )
                            .toList() ??
                        [],
                    onChanged: (value) {
                      context.read<HomeCubit>().setToCurrency(value);
                    });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.isHistoricalRatesEnabled() !=
                  current.isHistoricalRatesEnabled(),
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.isHistoricalRatesEnabled()
                      ? () {
                          context.read<HomeCubit>().getHistoricalRates();
                        }
                      : null,
                  child: const Text('Get Historical Rates'),
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  previous.historicalLoading != current.historicalLoading ||
                  previous.historicalRates != current.historicalRates,
              builder: (context, state) {
                state.historicalLoading.toString().log(
                      tag: 'Historical Loading',
                    );
                if (state.historicalLoading == true) {
                  return const Center(
                    child: CircularProgressIndicator(

                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Historical Rates',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    if (state.historicalRates != null)
                      ...state.historicalRates!.map(
                        (e) => ListTile(
                          title: Text(
                            e.keys.first,
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${state.fromCurrency!.currencyName} : ${(e.values.first[state.toCurrency!.currencyCode] as double).toStringAsFixed(2)} ${state.toCurrency!.currencyName}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
