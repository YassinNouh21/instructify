import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/app.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/application/bloc/search_bloc.dart';
import 'package:instructify/bloc_observer.dart';
import 'package:instructify/firebase_options.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
import 'package:instructify/injection.dart';

import 'application/validation/validation_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return BlocOverrides.runZoned(
    () async {
      configureInjection(Environment.prod);
      await PreferenceRepository.initializePreference();
      PreferenceRepository.pref.setBool('isFirstTime', true);
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<ValidationBloc>(
              create: (BuildContext context) => getIt<ValidationBloc>(),
            ),
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
