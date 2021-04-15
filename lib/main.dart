// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'package:cxl/app.dart';
import 'package:cxl/dependency_injection.dart';
import 'bloc/example_observer.dart';

void main() {
  Bloc.observer = ExampleObserver();
  configureInjection(Environment.prod);
  runApp(App());
}
