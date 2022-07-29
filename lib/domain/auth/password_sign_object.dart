import 'package:dartz/dartz.dart';
import 'package:form_validator/form_validator.dart';

import 'package:instructify/domain/core/sign_form_failure.dart';
import 'package:instructify/domain/core/sign_object.dart';

class PasswordSignObject extends SignObject<String> {
  final Either<SignFormFailure<String>, String> value;
  final Either<SignFormFailure<String>, String> repeatedValue;

  PasswordSignObject._(this.value, this.repeatedValue);

  factory PasswordSignObject.validate(
      String password, String repeatedPassword) {
    final validatorPassword =
        ValidationBuilder().minLength(6, 'Password too short').test(password);
    if (password != repeatedPassword) {
      return PasswordSignObject._(
          const Left(
              SignFormFailure.shortPassword(failedValue: 'Password not match')),
          const Left(SignFormFailure.shortPassword(
              failedValue: 'Password not match')));
    } else {
      switch (validatorPassword) {
        case 'Password too short':
          return PasswordSignObject._(
              const Left(SignFormFailure.shortPassword(
                  failedValue: 'Password too short')),
              const Left(SignFormFailure.shortPassword(
                  failedValue: 'Password too short')));
        case 'The field is required':
          return PasswordSignObject._(
              const Left(SignFormFailure.empty(failedValue: 'Required field')),
              const Left(SignFormFailure.empty(failedValue: 'Required field')));
        default:
          return PasswordSignObject._(Right(password), Right(repeatedPassword));
      }
    }
  }

  @override
  String toString() =>
      'PasswordSignObject(value: ${value.fold((l) => l.toString(), (r) => r)} \nrepeatedValue: ${value.fold((l) => l.toString(), (r) => r)})';
}
