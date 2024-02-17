import 'package:currency_converter_task/features/Home/presentation/manager/home_cubit.dart';
import 'package:currency_converter_task/features/Home/presentation/widgets/converter_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection_container.dart';
import '../widgets/history_tab.dart';

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
  final List<Tab> tabs = <Tab>[
    const Tab(
      text: 'Converter',
    ),
    const Tab(
      text: 'History',
    ),
  ];

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getCurrencies();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
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
            bottom: TabBar(
              tabs: tabs,
            ),
          ),
          body: MultiBlocListener(
            listeners: [
              BlocListener<HomeCubit, HomeState>(
                listenWhen: (previous, current) =>
                    previous.error != current.error,
                listener: (context, state) {
                  if (state.error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          state.error!.message,
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
            ],
            child: TabBarView(
              children: [
                ConverterTab(),
                const HistoryTab(),
              ],
            ),
          )),
    );
  }
}
