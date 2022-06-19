import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:sizer/sizer.dart';

import 'presentation/resource/theme_manager.dart';

class MyApp extends StatelessWidget {
  
  static const instance = MyApp._private();
  const MyApp._private();
  factory MyApp() => instance;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ScreenUtilInit(
          designSize: const Size(414, 868),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              
              theme: getApplicationTheme(context),
              title: 'Flutter Demo',
              onGenerateRoute: RouteGenerator.getRoute,
            );
          });
    });
  }
}
