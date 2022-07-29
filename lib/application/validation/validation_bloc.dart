import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:instructify/domain/auth/email_sign_object.dart';
import 'package:instructify/domain/auth/i_auth_facade.dart';
import 'package:instructify/domain/auth/password_sign_object.dart';
import 'package:instructify/domain/core/auth_failure.dart';

part 'validation_event.dart';
part 'validation_state.dart';
part 'validation_bloc.freezed.dart';

@injectable
class ValidationBloc extends Bloc<ValidationEvent, ValidationState> {
  final IAuthFacade authFacade;

  ValidationBloc(this.authFacade) : super(ValidationState.initial()) {
    on<ValidationEvent>(_onRegisterWithEmailAndPasswordPressed);
  }

  void _onRegisterWithEmailAndPasswordPressed(
      ValidationEvent event, Emitter<ValidationState> emit) async {
    Either<AuthFailure, Unit>? authFailureOrSuccess;

    if (state.emailAddress.value.isRight() && state.password.value.isRight()) {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      final authFailureOrSuccess =
          await authFacade.registerWithEmailAndPassword(
        imgUrl: '',
        emailAddress: state.emailAddress,
        password: state.password,
      );
      emit(state.copyWith(
        isSubmitting: false,
        authFailureOrSuccessOption: Some(authFailureOrSuccess),
      ));
    }
    emit(state.copyWith(
      isSubmitting: false,
      showErrorMessages: authFailureOrSuccess == null ? true : false,
      authFailureOrSuccessOption: optionOf(authFailureOrSuccess),
    ));
  }
}
