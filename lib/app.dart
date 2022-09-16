import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instructify/application/bloc/connection_bloc.dart'
    as connection;
import 'package:instructify/application/bloc/connection_bloc.dart';
import 'package:instructify/presentation/resource/route_manager.dart';
import 'package:instructify/presentation/screens/no_connection/no_connection_screen.dart';
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
          builder: (context, child) {
            return MaterialApp(
              theme: getApplicationTheme(context),
              title: 'Instructify',
              builder: (context, child) {
                return BlocBuilder<ConnectionBloc, connection.ConnectionState>(
                  builder: (_, stte) {
                    debugPrint('Material App $stte');
                    if (stte.status == connection.ConnectionStatus.connected) {
                      return child!;
                    } else {
                      return const NoConnectionScreen();
                    }
                  },
                );
              },
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.getRoute,
            );
          });
    });
  }
}
