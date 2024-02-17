import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/currency_entity.dart';
import '../manager/home_cubit.dart';
import 'drop_down_custom_item.dart';

class ConverterTab extends StatelessWidget {
  final _controller = TextEditingController();
  final _resultController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ConverterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          previous.conversionResult != current.conversionResult,
      listener: (context, state) {
        _resultController.text =
            state.conversionResult?.toStringAsFixed(2) ?? '';
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
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
                                    child: DropDownCustomItem(
                                      value: e,
                                    ),
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
                                    child: DropDownCustomItem(
                                      value: e,
                                    ),
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
                TextFormField(
                  controller: _controller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter amount';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    context.read<HomeCubit>().changeAmount(value);
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter amount',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.isConversionEnabled() !=
                      current.isConversionEnabled(),
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state.isConversionEnabled()
                          ? () {
                              context.read<HomeCubit>().convertCurrency();
                            }
                          : null,
                      child: const Text('Convert'),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      previous.conversionLoading !=
                          current.conversionLoading ||
                      previous.conversionResult != current.conversionResult,
                  builder: (context, state) {
                    if (state.conversionLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return TextField(
                      controller: _resultController,
                      readOnly: true,
                      decoration: const InputDecoration(
                        hintText: 'Conversion result',
                      ),
                      keyboardType: TextInputType.number,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
