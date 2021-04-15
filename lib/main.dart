import 'package:cxl/app.dart';
import 'package:cxl/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'bloc/example_observer.dart';

void main() {
  Bloc.observer = ExampleObserver();
  configureInjection(Environment.prod);
  runApp(App());
}
