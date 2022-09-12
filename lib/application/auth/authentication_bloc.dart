import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/auth/password_sign_object.dart';
import 'package:instructify/domain/core/auth_failure.dart';
import 'package:instructify/infrastructure/auth/local_auth.dart';
import 'package:instructify/model/user.dart';

import '../../domain/auth/email_sign_object.dart';
import '../../domain/auth/i_auth_facade.dart';
import '../../domain/firebase/i_firebase_cloud.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthFacade _authFacade;
  final IFirebaseCloud _firebaseCloud;
  AuthenticationBloc(this._authFacade, this._firebaseCloud)
      : super(AuthenticationState.initial()) {
    on<AuthenticationSignIn>(_onSignInWithEmailAndPasswordPressed);
    on<AuthenticationRegister>(_onRegisterWithEmailAndPasswordPressed);
    on<AuthenicationSignInWithGoogle>(_onSignInWithGooglePressed);
    on<AuthenticationSignOut>(_onSignOutPressed);
    on<AuthenticationFavoriteCourse>(_onFavoriteCourse);
  }

  Future<void> _onSignInWithEmailAndPasswordPressed(
      AuthenticationSignIn event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    await _authFacade
        .signInWithEmailAndPassword(
            emailAddress: EmailSignObject.validate(event.email),
            password:
                PasswordSignObject.validate(event.password, event.password))
        .then((value) => value.fold(
              (l) => emit(state.copyWith(
                  isSubmitting: false,
                  showErrorMessages: true,
                  state: AuthenticationStates.unAuthenticated,
                  authFailureOrSuccessOption: some(left(l)))),
              (r) => emit(
                state.copyWith(
                  isSubmitting: false,
                  showErrorMessages: false,
                  state: AuthenticationStates.authenticated,
                  authFailureOrSuccessOption: some(right(r)),
                ),
              ),
            ));
  }

  @override
  void onTransition(
      Transition<AuthenticationEvent, AuthenticationState> transition) {
    print(
        'on ${transition.event} from ${transition.currentState} -> ${transition.nextState}');
    super.onTransition(transition);
  }

  Future<void> _onRegisterWithEmailAndPasswordPressed(
      AuthenticationRegister event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      state: AuthenticationStates.unAuthenticated,
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    await _authFacade
        .registerWithEmailAndPassword(
            emailAddress: event.email, password: event.password)
        .then((value) {
      value.fold(
          (l) => emit(state.copyWith(
                isSubmitting: false,
                showErrorMessages: true,
                state: AuthenticationStates.unAuthenticated,
                authFailureOrSuccessOption: some(
                  left(l),
                ),
              )), (r) {
        User temp = User(
          email: event.email,
          fullName: event.firstName + ' ' + event.lastName,
          type: 'student',
          userId: r.user!.uid,
          favoriteCourses: const [],
        );
        _firebaseCloud.registerUser(temp);
        // deb x ugPrint('User Registered $temp');
        PreferenceRepository.pref.setString(
          'user',
          jsonDecode(json.encode(temp)),
        );
        emit(
          state.copyWith(
            isSubmitting: false,
            showErrorMessages: false,
            state: AuthenticationStates.authenticated,
            authFailureOrSuccessOption: some(right(unit)),
          ),
        );
      });
    });
  }

  FutureOr<void> _onSignOutPressed(
      AuthenticationSignOut event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));
    await PreferenceRepository.pref.clear();
    await _authFacade.signOut();
    emit(
      state.copyWith(
        state: AuthenticationStates.unAuthenticated,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  User get localUser => PreferenceRepository.pref.getString('user') != null
      ? User.fromMap(jsonDecode(PreferenceRepository.pref.getString('user')!))
      : User.empty();

  Future<void> _onFavoriteCourse(AuthenticationFavoriteCourse event,
      Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: some(right(unit)),
    ));
    final user = User.fromJson(
        PreferenceRepository.getDataFromSharedPreference(key: 'user'));
    if (user.userId!.isNotEmpty) {
      if (user.favoriteCourses!.contains(event.courseId)) {
        user.favoriteCourses!.remove(event.courseId);
        await _firebaseCloud
            .removeFavoriteCourse(event.courseId, user.userId!)
            .then((value) => value.fold(
                    (l) => emit(state.copyWith(
                          isSubmitting: false,
                          authFailureOrSuccessOption: some(left(l)),
                        )), (r) async {
                  debugPrint('delete user: ${user.toJson().toString()}');
                  await PreferenceRepository.pref.setString(
                    'user',
                    jsonDecode(json.encode(user)),
                  );

                  emit(state.copyWith(
                    isSubmitting: false,
                    authFailureOrSuccessOption: some(right(unit)),
                  ));
                }));
      } else {
        await _firebaseCloud
            .addFavoriteCourse(event.courseId, user.userId)
            .then(
              (value) => value.fold(
                  (l) => emit(state.copyWith(
                        isSubmitting: false,
                        authFailureOrSuccessOption: some(left(l)),
                      )), (r) async {
                final tempUser = User.fromJson(
                    await PreferenceRepository.getDataFromSharedPreference(
                        key: 'user'));
                final tempListCourses = tempUser.favoriteCourses;
                bool? check = tempListCourses?.contains(event.courseId);
                check! ? null : tempListCourses!.add(event.courseId);
                tempUser.copyWith(favoriteCourses: tempListCourses);
                debugPrint(tempUser.toJson().toString());
                await PreferenceRepository.pref.setString(
                  'user',
                  jsonDecode(json.encode(tempUser)),
                );
                emit(
                  state.copyWith(
                    isSubmitting: false,
                    authFailureOrSuccessOption: some(right(r)),
                  ),
                );
              }),
            );
      }
    }
  }

  Future<void> _onSignInWithGooglePressed(AuthenicationSignInWithGoogle event,
      Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));

    await _authFacade.signInWithGoogle().then((value) => value.fold(
            (l) => emit(state.copyWith(
                  isSubmitting: false,
                  state: AuthenticationStates.unAuthenticated,
                  authFailureOrSuccessOption: some(left(l)),
                )), (r) {
          emit(state.copyWith(
            isSubmitting: false,
            state: AuthenticationStates.authenticated,
            authFailureOrSuccessOption: some(right(unit)),
          ));
        }));
  }
}
