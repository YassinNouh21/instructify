part of 'validation_bloc.dart';

@freezed
class ValidationState with _$ValidationState {
  const factory ValidationState({
    required EmailSignObject emailAddress,
    required PasswordSignObject password,
    required bool isSubmitting,
    required bool showErrorMessages,
    required Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  }) = _ValidationState;
  factory ValidationState.initial() => ValidationState(
        emailAddress: EmailSignObject.validate(''),
        password: PasswordSignObject.validate('',''),
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}