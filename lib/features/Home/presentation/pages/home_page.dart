import 'package:currency_converter_task/features/Home/domain/entities/currency_entity.dart';
import 'package:currency_converter_task/features/Home/presentation/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<HomeCubit>(),
      child: const _Page(),
    );
  }
}

class _Page extends StatefulWidget {
  const _Page();

  @override
  State<_Page> createState() => _PageState();
}

class _PageState extends State<_Page> {
  final _controller = TextEditingController();
  final _resultController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Currency Converter',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            centerTitle: true,
            elevation: 4,
          ),
          body: MultiBlocListener(
            listeners: [
              BlocListener<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
              ),
              BlocListener<HomeCubit, HomeState>(
                listenWhen: (previous, current) =>
                    previous is CurrenciesLoaded &&
                    current is CurrenciesLoaded,
                listener: (context, state) {
                  if (state is CurrenciesLoaded) {
                    if(state.conversionRate == null) {
                      _resultController.clear();
                      _controller.clear();
                    }
                    if (_controller.text.isNotEmpty) {
                      _resultController.text =
                          (double.parse(_controller.text) *
                                  state.conversionRate!)
                              .toStringAsFixed(2);
                    } else {
                      _resultController.clear();
                    }
                  }
                },
              ),
            ],
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is CurrenciesLoaded) {
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
                          DropdownButton<CurrencyEntity>(
                              isExpanded: true,
                              value: state.fromCurrency,
                              items: state.currencies
                                  .map(
                                    (e) => DropdownMenuItem<CurrencyEntity>(
                                      value: e,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(e.currencySymbol,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              )),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            e.currencyName,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                context
                                    .read<HomeCubit>()
                                    .setFromCurrency(value);
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          const Text('To',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          DropdownButton<CurrencyEntity>(
                              isExpanded: true,
                              value: state.toCurrency,
                              items: state.currencies
                                  .map(
                                    (e) => DropdownMenuItem<CurrencyEntity>(
                                      value: e,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(e.currencySymbol,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                              )),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            e.currencyName,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                context.read<HomeCubit>().setToCurrency(value);
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              hintText: 'Enter amount',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                            onPressed: state.fromCurrency != null &&
                                    state.toCurrency != null
                                ? () {
                                    context.read<HomeCubit>().convertCurrency(
                                        state.fromCurrency!.currencyCode,
                                        state.toCurrency!.currencyCode);
                                  }
                                : null,
                            child: const Text('Convert'),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          state.loading
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : TextField(
                                  controller: _resultController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Conversion result',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                        ],
                      ),
                    ),
                  );
                } else if (state is HomeError) {
                  return Center(
                    child: Text(state.message),
                  );
                }
                return const SizedBox();
              },
            ),
          )),
    );
  }
}
