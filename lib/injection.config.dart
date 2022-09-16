// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i8;

import 'application/auth/authentication_bloc.dart' as _i14;
import 'application/bloc/connection_bloc.dart' as _i10;
import 'application/bloc/favorite_bloc.dart' as _i15;
import 'application/bloc/fetch_bloc.dart' as _i16;
import 'application/bloc/injectable_modules.dart' as _i18;
import 'application/bloc/search_bloc.dart' as _i9;
import 'application/validation/validation_bloc.dart' as _i13;
import 'domain/auth/i_auth_facade.dart' as _i11;
import 'domain/firebase/i_firebase_cloud.dart' as _i6;
import 'infrastructure/auth/auth_firebase.dart' as _i12;
import 'infrastructure/core/injectable_modules.dart' as _i17;
import 'infrastructure/firebase_cloud/firebase_cloud.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  final injectableModules = _$InjectableModules();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseCloud);
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i6.IFirebaseCloud>(
      () => _i7.CloudRepository(get<_i4.FirebaseFirestore>()));
  gh.lazySingleton<_i8.InternetConnectionChecker>(
      () => injectableModules.connectionChecker);
  gh.factory<_i9.SearchBloc>(() => _i9.SearchBloc(get<_i6.IFirebaseCloud>()));
  gh.factory<_i10.ConnectionBloc>(
      () => _i10.ConnectionBloc(get<_i8.InternetConnectionChecker>()));
  gh.lazySingleton<_i11.IAuthFacade>(() => _i12.AuthFirebase(
        get<_i3.FirebaseAuth>(),
        get<_i5.GoogleSignIn>(),
        get<_i6.IFirebaseCloud>(),
        get<_i4.FirebaseFirestore>(),
      ));
  gh.factory<_i13.ValidationBloc>(
      () => _i13.ValidationBloc(get<_i11.IAuthFacade>()));
  gh.factory<_i14.AuthenticationBloc>(() => _i14.AuthenticationBloc(
        get<_i11.IAuthFacade>(),
        get<_i6.IFirebaseCloud>(),
      ));
  gh.factory<_i15.FavoriteBloc>(() => _i15.FavoriteBloc(
        get<_i11.IAuthFacade>(),
        get<_i6.IFirebaseCloud>(),
      ));
  gh.factory<_i16.FetchBloc>(() => _i16.FetchBloc(
        get<_i6.IFirebaseCloud>(),
        get<_i14.AuthenticationBloc>(),
      ));
  return get;
}

class _$FirebaseInjectableModule extends _i17.FirebaseInjectableModule {}

class _$InjectableModules extends _i18.InjectableModules {}
