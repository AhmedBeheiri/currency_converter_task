// ignore_for_file: depend_on_referenced_packages
import 'dart:developer';

import 'package:currency_converter_task/features/Home/data/local/models/currency_local_model.dart';
import 'package:currency_converter_task/features/Home/presentation/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/di/injection_container.dart' as di;
import 'package:logging/logging.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  di.configureInjection();
  await Hive.initFlutter();
  Hive.registerAdapter(CurrencyLocalModelAdapter());

  runApp(const MyApp());
  Logger.root.level =
  !kDebugMode ? Level.OFF : Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    log(
      '${record.loggerName}: ${record.message}',
      level: record.level.value,
      name: record.level.name,
      time: record.time,
      error: record.error,
      stackTrace: record.stackTrace,
      zone: record.zone,
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

