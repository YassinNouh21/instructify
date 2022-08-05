import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/auth/password_sign_object.dart';
import 'package:instructify/domain/core/auth_failure.dart';

import '../../domain/auth/email_sign_object.dart';
import '../../domain/auth/i_auth_facade.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

@injectable
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final IAuthFacade _authFacade;

  AuthenticationBloc(this._authFacade) : super(AuthenticationState.initial()) {
    on<AuthenticationSignIn>(_onSignInWithEmailAndPasswordPressed);
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
}
