part of 'validation_bloc.dart';

@freezed
class ValidationEvent with _$ValidationEvent {
  const factory ValidationEvent.registerWithEmailAndPasswordPressed({
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String password,
    required String confirmPassword,
    required String imgUrl,
  }) = RegisterWithEmailAndPasswordPressed;
  const factory ValidationEvent.signInWithEmailAndPasswordPressed() =
      SignInWithEmailAndPasswordPressed;
  const factory ValidationEvent.signInWithGooglePressed() =
      SignInWithGooglePressed;
}
