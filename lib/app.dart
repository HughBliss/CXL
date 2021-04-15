import 'package:cxl/router.dart' as Router;
import 'package:cxl/services/navigator_service.dart';
import 'package:cxl/ui/screens/home.dart';
import 'package:flutter/material.dart';

import 'dependency_injection.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt<NavigatorService>().navigatorKey,
      onGenerateRoute: Router.generateRoute,
      home: HomeScreen(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}
