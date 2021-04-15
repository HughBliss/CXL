import 'package:cxl/app.dart';
import 'package:cxl/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  runApp(App());
}
