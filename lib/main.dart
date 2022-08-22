import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/app.dart';
import 'package:instructify/application/auth/authentication_bloc.dart';
import 'package:instructify/domain/auth/i_auth_facade.dart';
import 'package:instructify/firebase_options.dart';
import 'package:instructify/injection.dart';

import 'application/validation/validation_bloc.dart';

void main() async {
  return BlocOverrides.runZoned(
    () async {
      configureInjection(Environment.prod);
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider<ValidationBloc>(
              create: (BuildContext context) => getIt<ValidationBloc>(),
            ),
            BlocProvider(
              create: (BuildContext context) => getIt<AuthenticationBloc>(),
            ),
            
          ],
          child: MyApp(),
        ),
      );
    },
  );
}
