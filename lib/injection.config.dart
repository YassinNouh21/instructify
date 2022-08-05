// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/authentication_bloc.dart' as _i8;
import 'application/validation/validation_bloc.dart' as _i7;
import 'domain/auth/i_auth_facade.dart' as _i5;
import 'infrastructure/auth/auth_firebase.dart' as _i6;
import 'infrastructure/core/injectable_modules.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i5.IAuthFacade>(() => _i6.AuthFirebase(
      auth: get<_i3.FirebaseAuth>(), googleSignIn: get<_i4.GoogleSignIn>()));
  gh.factory<_i7.ValidationBloc>(
      () => _i7.ValidationBloc(get<_i5.IAuthFacade>()));
  gh.factory<_i8.AuthenticationBloc>(
      () => _i8.AuthenticationBloc(get<_i5.IAuthFacade>()));
  return get;
}

class _$FirebaseInjectableModule extends _i9.FirebaseInjectableModule {}
