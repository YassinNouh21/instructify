import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/app.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/application/bloc/connection_bloc.dart';
import 'package:instructify/application/bloc/search_bloc.dart';
import 'package:instructify/bloc_observer.dart';
import 'package:instructify/firebase_options.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
import 'package:instructify/injection.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'application/validation/validation_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InternetConnectionChecker.createInstance(
          checkInterval: const Duration(seconds: 1))
      .onStatusChange
      .listen((event) {
    debugPrint('Internet status changed: $event');
    getIt<ConnectionBloc>().add(
      const ConnectionEvent.check(),
    );
  });
  return BlocOverrides.runZoned(
    () async {
      configureInjection(Environment.prod);
      await PreferenceRepository.initializePreference();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<ValidationBloc>(
              create: (BuildContext context) => getIt<ValidationBloc>(),
            ),
            BlocProvider<ConnectionBloc>(
                create: (BuildContext context) => getIt<ConnectionBloc>()
                  ..add(
                    const ConnectionEvent.check(),
                  )),
            BlocProvider<SearchBloc>(
              create: (BuildContext context) => getIt<SearchBloc>(),
            ),
            BlocProvider(
              create: (BuildContext context) => getIt<AuthenticationBloc>(),
            ),
          ],
          child: MyApp(),
        ),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}
