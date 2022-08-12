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

class AuthenticationRegister extends AuthenticationEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phonewNumber;

  AuthenticationRegister({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.phonewNumber,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthenticationRegister &&
        other.email == email &&
        other.password == password &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phonewNumber == phonewNumber;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        phonewNumber.hashCode;
  }
}

class AuthenticationSignOut extends AuthenticationEvent {}
