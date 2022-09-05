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

  AuthenticationRegister({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthenticationRegister &&
        other.email == email &&
        other.password == password &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        firstName.hashCode ^
        lastName.hashCode;
  }
}

class AuthenticationSignOut extends AuthenticationEvent {}

class AuthenticationAddCourseToUser extends AuthenticationEvent {
  final String courseId;
  final User user;
  AuthenticationAddCourseToUser({
    required this.courseId,
    required this.user,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthenticationAddCourseToUser &&
        other.courseId == courseId &&
        other.user == user;
  }

  @override
  int get hashCode => courseId.hashCode ^ user.hashCode;
}
