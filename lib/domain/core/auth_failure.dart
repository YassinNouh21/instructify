import 'package:flutter/material.dart';

Map<String, AuthFailure> _authFailureLookup = const {
  'user-disabled': CancelledByUser(),
  'user-not-found': InvalidEmailAndPasswordCombination(),
  'wrong-password': InvalidEmailAndPasswordCombination(),
  'email-already-in-use': EmailAlreadyInUse(),
  'weak-password': WeakPassword(),
  'invalid-email': InvalidEmail(),
};

@immutable
class AuthFailure implements Exception {
  final String errorMessage;
  const AuthFailure._({required this.errorMessage});

  factory AuthFailure.getFailure(String errorCode) {
    if (_authFailureLookup.containsKey(errorCode)) {
      return _authFailureLookup[errorCode]!;
    } else {
      return const ServerError();
    }
  }
}

class CancelledByUser extends AuthFailure {
  const CancelledByUser()
      : super._(errorMessage: 'This user has been disabled');
}

class InvalidEmailAndPasswordCombination extends AuthFailure {
  const InvalidEmailAndPasswordCombination()
      : super._(errorMessage: 'Invalid email and password combination');
}

class ServerError extends AuthFailure {
  const ServerError() : super._(errorMessage: 'Server Error');
}

class InvalidEmail extends AuthFailure {
  const InvalidEmail() : super._(errorMessage: ' Invalid Email');
}

class EmailAlreadyInUse extends AuthFailure {
  const EmailAlreadyInUse()
      : super._(errorMessage: 'This email is already in use');
}

class WeakPassword extends AuthFailure {
  const WeakPassword() : super._(errorMessage: 'This password is too weak');
}
