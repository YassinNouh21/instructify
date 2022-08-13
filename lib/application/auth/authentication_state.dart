part of 'authentication_bloc.dart';

enum AuthenticationStates {
  unAuthenticated,
  authenticated,
}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState(
    AuthenticationStates state,
    bool showErrorMessages,
    bool isSubmitting,
    Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption,
  ) = _AuthenticationState;
  factory AuthenticationState.initial() => AuthenticationState(
        AuthenticationStates.unAuthenticated,
        false,
        false,
        none(),
      );
}
