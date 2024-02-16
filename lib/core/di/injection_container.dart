import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection_container.config.dart' as inject;

final di = GetIt.instance;

@injectableInit
void configureInjection() => di.init();
