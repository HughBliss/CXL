import 'package:cxl/ui/screens/home.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "Home":
      return getRoute(HomeScreen(title: 'title'));
    default:
      return getRoute(Center(
        child: Text('No path for ${settings.name}'),
      ));
  }
}

MaterialPageRoute getRoute(Widget page) {
  return MaterialPageRoute(builder: (context) => page);
}
