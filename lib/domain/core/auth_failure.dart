import 'package:flutter/material.dart';

Map<String, AuthFailure> _authFailureLookup = {
  'user-disabled': CancelledByUser(),
  'user-not-found': InvalidEmailAndPasswordCombination(),
  'wrong-password': InvalidEmailAndPasswordCombination(),
};
Map<AuthFailure, String> _authFailureErrorMessage = {
  AuthFailure.cancelledByUser(): 'This user has been disabled',
  AuthFailure.invalidEmailAndPasswordCombination():
      ' Invalid email and password combination',
  AuthFailure.serverError(): 'Server Error',
};

@immutable
class AuthFailure implements Exception {
  final String errorMessage;
  AuthFailure._({required this.errorMessage});
  factory AuthFailure.cancelledByUser() => AuthFailure._(
      errorMessage: _authFailureErrorMessage[AuthFailure.cancelledByUser()]!);
  factory AuthFailure.serverError() => AuthFailure._(
      errorMessage: _authFailureErrorMessage[AuthFailure.serverError()]!);
  factory AuthFailure.invalidEmailAndPasswordCombination() => AuthFailure._(
      errorMessage: _authFailureErrorMessage[
          AuthFailure.invalidEmailAndPasswordCombination()]!);
  factory AuthFailure.emailAlreadyInUse() => AuthFailure._(
      errorMessage: _authFailureErrorMessage[AuthFailure.emailAlreadyInUse()]!);
  factory AuthFailure.getFailure(String errorCode) {
    switch (errorCode) {
      case 'user-disabled':
        return _authFailureLookup['user-disabled']!;
      case 'user-not-found':
        return _authFailureLookup['user-not-found']!;
      case 'wrong-password':
        return _authFailureLookup['wrong-password']!;

      default:
        return ServerError();
    }
  }
  AuthFailure get cancelledByUser => AuthFailure.cancelledByUser();
  AuthFailure get serverError => AuthFailure.serverError();
  AuthFailure get invalidEmailAndPasswordCombination =>
      AuthFailure.invalidEmailAndPasswordCombination();
  AuthFailure get emailAlreadyInUse => AuthFailure.emailAlreadyInUse();
}

class CancelledByUser extends AuthFailure {
  CancelledByUser() : super._(errorMessage: 'This user has been disabled');
}

class InvalidEmailAndPasswordCombination extends AuthFailure {
  InvalidEmailAndPasswordCombination()
      : super._(errorMessage: 'Invalid email and password combination');
}

class ServerError extends AuthFailure {
  ServerError() : super._(errorMessage: 'Server Error');
}
