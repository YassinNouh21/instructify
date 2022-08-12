// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;

import 'application/auth/authentication_bloc.dart' as _i11;
import 'application/validation/validation_bloc.dart' as _i10;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'domain/firebase/i_firebase_cloud.dart' as _i8;
import 'infrastructure/auth/auth_firebase.dart' as _i7;
import 'infrastructure/core/injectable_modules.dart' as _i12;
import 'infrastructure/firebase_cloud/firebase_cloud.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i4.FirebaseFirestore>(
      () => firebaseInjectableModule.firebaseCloud);
  gh.lazySingleton<_i5.GoogleSignIn>(
      () => firebaseInjectableModule.googleSignIn);
  gh.lazySingleton<_i6.IAuthFacade>(
      () => _i7.AuthFirebase(get<_i3.FirebaseAuth>(), get<_i5.GoogleSignIn>()));
  gh.lazySingleton<_i8.IFirebaseCloud>(
      () => _i9.CloudRepository(firestore: get<_i4.FirebaseFirestore>()));
  gh.factory<_i10.ValidationBloc>(
      () => _i10.ValidationBloc(get<_i6.IAuthFacade>()));
  gh.factory<_i11.AuthenticationBloc>(() => _i11.AuthenticationBloc(
      get<_i6.IAuthFacade>(), get<_i8.IFirebaseCloud>()));
  return get;
}

class _$FirebaseInjectableModule extends _i12.FirebaseInjectableModule {}
