import 'package:flutter/material.dart';
import 'package:instructify/presentation/resource/route_manager.dart';

import 'presentation/resource/theme_manager.dart';

class MyApp extends StatelessWidget {
  static const instance = MyApp._private();
  const MyApp._private();
  factory MyApp() => instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(context),
      title: 'Flutter Demo',
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.onBoardingRoute,
    );
  }
}
