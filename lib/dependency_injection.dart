// Package imports:
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'dependency_injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) => $initGetIt(getIt, environment: env);
