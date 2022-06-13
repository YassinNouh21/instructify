import 'package:flutter/material.dart';

import 'presentation/resource/theme_manager.dart';
import 'presentation/screens/on_boarding/on_boarding_view.dart';

class MyApp extends StatelessWidget{
  static  const instance=  MyApp._private();
  const MyApp._private();
  factory MyApp() => instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: getApplicationTheme(context),
      title: 'Flutter Demo',
      home: OnBoardingView(),
    );
  }
}
