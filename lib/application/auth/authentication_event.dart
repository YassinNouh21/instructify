part of 'authentication_bloc.dart';

// class AuthenticationEvent with _$AuthenticationEvent {
//   const factory AuthenticationEvent.logOut() = LogOut;
//   const factory AuthenticationEvent.loggedIn(
//     String email,
//     String password,
//   ) = LoggedIn;
//   const factory AuthenticationEvent.register() = Register;
// }
abstract class AuthenticationEvent {}

class AuthenticationSignIn extends AuthenticationEvent {
  final String email;
  final String password;

  AuthenticationSignIn({
    required this.email,
    required this.password,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthenticationSignIn &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}

class AuthenticationSignOut extends AuthenticationEvent {}
