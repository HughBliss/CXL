// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:cxl/router.dart' as router;
import 'package:cxl/services/navigator_service.dart';
import 'package:cxl/ui/screens/home.dart';
import 'dependency_injection.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigatorService>().navigatorKey,
      onGenerateRoute: router.generateRoute,
      home: HomeScreen(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}
