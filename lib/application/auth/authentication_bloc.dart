import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/auth/password_sign_object.dart';
import 'package:instructify/domain/core/auth_failure.dart';

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
    // on<AuthenticationRegister>(_onRegisterWithEmailAndPasswordPressed);
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
        .then((value) => emit(state.copyWith(
              authFailureOrSuccessOption: some(value),
              isSubmitting: false,
            )));
  }

  @override
  void onTransition(
      Transition<AuthenticationEvent, AuthenticationState> transition) {
    super.onTransition(transition);

    print(
        'Event: ${transition.event}// Current: ${transition.currentState}// NextState: ${transition.nextState}');
  }

  // Future<void> _onRegisterWithEmailAndPasswordPressed(
  //     AuthenticationRegister event, Emitter<AuthenticationState> emit) async {
  //   emit(state.copyWith(
  //     isSubmitting: true,
  //     authFailureOrSuccessOption: none(),
  //   ));

  //   await _authFacade
  //       .registerWithEmailAndPassword(
  //           emailAddress: event.email, password: event.password)
  //       .then((value) => emit(state.copyWith(
  //             authFailureOrSuccessOption: some(value),
  //             isSubmitting: false,
  //           )));
  // }
}
