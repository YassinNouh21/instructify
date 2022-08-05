part of 'authentication_bloc.dart';

enum AuthenticationStates {
  logOut,
  loggedIn,
  registered,
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
        AuthenticationStates.logOut,
        false,
        false,
        none(),
      );
}
